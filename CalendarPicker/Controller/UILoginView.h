//
//  UILoginView.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ReactiveCocoa/ReactiveCocoa.h>
@interface UILoginView : UIView

@property (nonatomic, strong) UITextField *userNameTF;

@property (nonatomic, strong) UITextField *pwdTF;

@property (nonatomic, strong) UIButton *loginBtn;

@end
