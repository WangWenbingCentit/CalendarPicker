//
//  LoginViewModel.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginSessionManager.h"

@interface LoginViewModel ()
// 如果有表,还需要导入UITableViewDataSource;
@end

@implementation LoginViewModel
- (RACSignal *)enableLoginSignal
{
    if (!_enableLoginSignal) {
        _enableLoginSignal = [RACSubject subject];
    }
    return _enableLoginSignal;
}

- (Account *)account
{
    if (!_account) {
        _account = [[Account alloc] init];
    }
    return _account;
}

- (NSArray *)userArray
{
    if (!_userArray) {
        _userArray = [[NSArray alloc] init];
    }
    return _userArray;
}
- (instancetype)init
{
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
}
- (void)initialBind
{
    
    // 监听账号的属性值改变，把他们聚合成一个信号。

    _enableLoginSignal = [RACSignal combineLatest:@[RACObserve([self account], accountName), RACObserve([self account], pwd)] reduce:^id(NSString *accountName, NSString *pwd){
        return @(accountName.length && pwd.length);
    }];
    //
    // 处理登录业务逻辑
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       // NSLog(@"%@",@"点击了登录");
        RACSignal *loginRequestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            // 模拟网络延迟
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [subscriber sendNext:@1];
//                
//                // 数据传送完毕，必须调用完成，否则命令永远处于执行状态
//                [subscriber sendCompleted];// 显示调用,如果不调用,将一直订阅
//            });
            [[LoginSessionManager sharedInstanceSession] projectList:@""].then(^(OVCResponse *response) {
                [subscriber sendNext:response];
                [subscriber sendCompleted];
            }).catch(^(NSError *error){
                NSLog(@"%@",[error localizedDescription]);
            });
            
            return nil;
        }];
        
        return [loginRequestSignal map:^id(id value) {
            NSMutableArray *dataSourceArray = [[[value result] valueForKey:@"data"] valueForKey:@"objList"];
            NSArray *modelArray = [[dataSourceArray.rac_sequence map:^id(id value) {
                return [MTLJSONAdapter modelOfClass:[Account class] fromJSONDictionary:value error:nil];
            }] array];
            return modelArray;
        }];
    }];
    
    // 监听登录产生的数据
  //从源信号中监听最后一条信号产生的数据
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        //
        if ([x isEqualToNumber:@1]) {
            NSLog(@"登录成功");
        }
        // 有了数据,刷新表格
        self.userArray = x;
        // 如果有数据源需要刷新表格
        //[self.tableView reload];
    }];
    // 监听登录状态(正在执行中的状态)
    [[_loginCommand.executing skip:1] subscribeNext:^(id x) {
        if ([x isEqualToNumber:@YES]) {
            // 正在登录中 用蒙版提示
        } else {
            // 登录成功,隐藏蒙版
        }
    }];
}
@end
