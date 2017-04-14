//
//  ViewController.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/3/25.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "ViewController.h"
#import "UIMessageViewController.h"
#import "UIWorkViewController.h"
#import "UIContactViewController.h"
#import "UIMessageView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACReturnSignal.h>
#import <ReactiveCocoa/NSObject+RACKVOWrapper.h>
#import "Flag.h"
#import "LoginSessionManager.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIMessageView *messageView;

@property (nonatomic, strong) UITextField *textFiled;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"天气不错";
#warning Data
    [[LoginSessionManager sharedInstanceSession] projectList:@""].then(^(OVCResponse *response){
        
        NSLog(@"response:%@",response);
    }).catch(^(NSError *error){
        NSLog(@"error:%@",error);
    });
    // RACSignal:有数据产生的时候,就使用RACSignal
    
    // RACSignal使用步骤: 1.创建信号  2.订阅信号 3.发送信号
    
    //创建信号(冷信号) 2.订阅信号(热信号) 3.发送信号
    RACSignal  *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // didSubscribe调用:只要一个信号被订阅就会调用
        // didSubscribe作用:发送数据
        //发送数据
        [subscriber sendNext:@"textFiled"];
           return [RACDisposable disposableWithBlock:^{
            // 只要信号取消订阅就会来这
            // 清空资源
            NSLog(@"信号被取消订阅了");
        }];;
    }];
    
    [signal subscribeNext:^(id x) {
        // nextBlock调用:只要订阅者发送数据就会调用
        // nextBlock作用:处理数据,展示到UI上面
        
        // x:信号发送的内容
        NSLog(@"%@",x);
    }];
    
    
    // 只要订阅者调用sendNext,就会执行nextBlock
    // 只要订阅RACDynamicSignal,就会执行didSubscribe
    // 前提条件是RACDynamicSignal,不同类型信号的订阅,处理订阅的事情不一样
    // Do any additional setup after loading the view, typically from a nib.
    
    //发送取消订阅信号
    // 1.创建订阅者,保存nextBlock
    // 2.订阅信号
    RACDisposable *disposable = [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    // 默认一个信号发送数据完毕们就会主动取消订阅.
    // 只要订阅者在,就不会自动取消信号订阅
    // 取消订阅信号
    [disposable dispose];
    // 订阅信号
    [_messageView.btnSingal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    /************************************KVO****************************************************/
    [_messageView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        NSLog(@"%@",value);
    }];
    
    [[_messageView rac_valuesAndChangesForKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
   /****************************************KVO******************************************************/
    
    /***************************************NSNotifition***********************************************************/
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidHideNotification object:self] subscribeNext:^(id x) {
        
    }];
    
    [self.textFiled.rac_textSignal subscribeNext:^(id x) {
         
    }];
    
    @weakify(self);
    [[self.messageView rac_signalForSelector:@selector(buttonClick:)] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"%@",self);
    }];
    RAC(_textFiled, text) = _textFiled.rac_textSignal;
    [RACObserve(_textFiled, text) subscribeNext:^(id x) {
        //返回一个信号,可以去订阅
    }];
    // 执行流程:
    
    // RACSubject被订阅,仅仅是保存订阅者
    // RACSubject发送数据,遍历所有的订阅,调用他们的nextBlock
    
   // [self loadDataSource];
}

- (void)loadDataSource
{
    // 高级用法
    // 会把集合中所有元素都映射成一个新的对象
    NSString *flagString = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
    NSArray *flags = [NSArray arrayWithContentsOfFile:flagString];
    
    NSArray *flags_array = [[flags.rac_sequence map:^id(id value) {
        // value:集合中元素
        // id:返回对象就是映射的值
        return [Flag flagWithDict:value];
    }] array];
    
  //  [self dict];
   // [self array];
    [self tuple];
}

- (void)dict
{
    NSDictionary *dict = @{  @"account" : @"WWB",
                                       @"name" : @"wang",
                                       @"age" : @21
                                     };
    // 转换成集合
    [dict.rac_sequence.signal  subscribeNext:^(id x) {
        // RACTupleUnpack:用来解析元组
        // 宏里面的参数,传需要解析出来的变量名
        // = 右边,放需要解析的元组
        
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"key:%@ - value: %@",key, value);
    }];
}
- (void)array
{
    //  如何没有数据源,需要发送订阅
    NSArray *flagArray = @[@"i", @"love", @"you"];
    [flagArray.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

// 元组
- (void)tuple
{
    NSArray *flags = @[@"We", @"are", @"the", @"world"];
    RACTuple *tuple = [RACTuple tupleWithObjectsFromArray:flags];
    NSLog(@"%@",(NSString *)tuple[0]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _messageView.frame = CGRectMake(50, 50, 200, 200);
}

- (void)bind
{
    // 创建源信号
    RACSubject *subject = [RACSubject subject];
    //绑定原信号,并且返回一个新的信号
    RACSignal *signal = [subject bind:^RACStreamBindBlock{
        return ^RACSignal*(id value, BOOL *stop){
            return [RACReturnSignal return:value];
        };
    }];
    //订阅信号
    [signal subscribeNext:^(id x) {
        
    }];
    // 发送源数据
    [subject sendNext:@1];
}

- (void)map
{
    RACSubject *subject = [RACSubject subject];
    
    RACSignal *signal = [subject map:^id(id value) {
        return [NSString stringWithFormat:@"%@ map",value];
    }];
    
    [signal subscribeNext:^(id x) {
        
    }];
    
    [subject sendNext:@1];
}

- (void)contact
{ // 执行完A-> 执行B 依赖关系
    RACSignal *signalA  = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@123];
        return nil;
    }];
    
    RACSignal *signalContat = [signalA concat:signalB];
    
    [signalContat subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}
// 无论哪个信号触发,都会执行订阅信号
- (void)merge
{
    RACSignal *singalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        return nil;
    }];
    
    RACSignal *singalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@2];
        return nil;
    }];
    
    RACSignal *singalMerge = [singalA merge:singalB];
    [singalMerge subscribeNext:^(id x) {
        
    }];
}
//将两个数值传送的值压缩成一个元组--夫妻关系:只有两个都发送值了,才执行
- (void)zip
{
    RACSubject *subject1 = [RACSubject subject];
    RACSubject *subject2 = [RACSubject subject];
    
    RACSignal *signalZip = [subject1 zipWith:subject2];
    [signalZip subscribeNext:^(id x) {
        
    }];
    
    [subject1 sendNext:@0];
    [subject1 sendNext:@1];
}
//combineLatest: 内聚，将多个信号聚合成一个信号，当每个信号sendNext的时候都会调用聚合信号的nextBlock，（rac_textSignal信号内部会自动调用sendNext）
- (void)comine
{
    NSArray *singalArray = @[_textFiled.rac_textSignal];
    RACSignal *signal = [RACSignal combineLatest:singalArray reduce:^id(NSString *name, NSString *pwd){
        return @(pwd.length && name.length);// NSNumber 发送Bool值
    }];
    
    @weakify(self);
    [signal subscribeNext:^(id x) {
        @strongify(self);
        self.textFiled.enabled = [x boolValue];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
