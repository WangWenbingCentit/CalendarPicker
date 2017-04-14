//
//  UILoginView.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "UILoginView.h"

@interface UILoginView ()

@end

@implementation UILoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    
    }
    return self;
}

- (void)setup
{
    UITextField *userNamaTF = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    userNamaTF.borderStyle = UITextBorderStyleRoundedRect;
    userNamaTF.placeholder = @"请输入用户名";
    [self addSubview:userNamaTF];
    _userNameTF = userNamaTF;
    
    UITextField *pwdTF = [[UITextField alloc] initWithFrame:CGRectMake(50, 170, 200, 50)];
    pwdTF.borderStyle = UITextBorderStyleRoundedRect;
    pwdTF.placeholder = @"请输入密码";
    [self addSubview:pwdTF];
    _pwdTF = pwdTF;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(50, 240, 200, 50);
    loginBtn.backgroundColor = [UIColor yellowColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:loginBtn];
    
    _loginBtn = loginBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //适配
    
}
@end
