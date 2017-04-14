//
//  UILoginViewController.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "UILoginViewController.h"
#import "UILoginView.h"
#import "LoginViewModel.h"
@interface UILoginViewController ()

//@property (nonatomic, weak) UILoginView *loginView;

@property (nonatomic, strong) LoginViewModel *loginViewModel;

@end

@implementation UILoginViewController

- (LoginViewModel *)loginViewModel
{
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

 
 /* 需求：1.监听两个文本框的内容，有内容才允许按钮点击
 2.默认登录请求.
 
 用MVVM：实现，之前界面的所有业务逻辑
 分析：1.之前界面的所有业务逻辑都交给控制器做处理
 2.在MVVM架构中把控制器的业务全部搬去VM模型，也就是每个控制器对应一个VM模型.
 
 步骤：1.创建LoginViewModel类，处理登录界面业务逻辑.
 2.这个类里面应该保存着账号的信息，创建一个账号Account模型
 3.LoginViewModel应该保存着账号信息Account模型。
 4.需要时刻监听Account模型中的账号和密码的改变，怎么监听？
 5.在非RAC开发中，都是习惯赋值，在RAC开发中，需要改变开发思维，由赋值转变为绑定，可以在一开始初始化的时候，就给Account模型中的属性绑定，并不需要重写set方法。
 6.每次Account模型的值改变，就需要判断按钮能否点击，在VM模型中做处理，给外界提供一个能否点击按钮的信号.
 7.这个登录信号需要判断Account中账号和密码是否有值，用KVO监听这两个值的改变，把他们聚合成登录信号.
 8.监听按钮的点击，由VM处理，应该给VM声明一个RACCommand，专门处理登录业务逻辑.
 9.执行命令，把数据包装成信号传递出去
 10.监听命令中信号的数据传递
 11.监听命令的执行时刻
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILoginView *loginView = [[UILoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // self.tableView.dataSource = self.loginViewModel;
   // self.loginViewModel.loginView = loginView;
    
    [self.view addSubview:loginView];
    
    RAC(self.loginViewModel.account, accountName) = loginView.userNameTF.rac_textSignal;
    RAC(self.loginViewModel.account, pwd) = loginView.userNameTF.rac_textSignal;
    RAC(loginView.loginBtn, enabled) = self.loginViewModel.enableLoginSignal;
    
    @weakify(self);
    [[loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {

        @strongify(self);
        [self.loginViewModel.loginCommand execute:nil];
    }];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
