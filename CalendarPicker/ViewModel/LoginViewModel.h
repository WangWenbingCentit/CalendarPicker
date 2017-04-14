//
//  LoginViewModel.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UILoginView.h"
#import "Account.h"

@interface LoginViewModel : NSObject

@property (nonatomic, strong) Account *account;
// 是否允许登录的信号
@property (nonatomic, strong) RACSignal *enableLoginSignal;

// 监听事件的调用过程,处理事件
@property (nonatomic, strong) RACCommand *loginCommand;

// 模型数组
@property (nonatomic, strong) NSArray<Account *> *userArray;

//@property (nonatomic, weak) UILoginView *loginView;// 可能是UIView ,TableView,ScrollView,CollectionView
// 总之是UIView的子类或者是衍生类 当然也可以是自定义的类


@end
