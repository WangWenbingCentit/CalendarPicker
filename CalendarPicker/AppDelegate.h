//
//  AppDelegate.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/3/25.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIMainViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readwrite) UIMainViewController *mianViewController;

@end

