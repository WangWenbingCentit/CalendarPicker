//
//  NSUserDefaults+FirstLaunchDefaults.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *kCompletedFirstRun;

@interface NSUserDefaults (FirstLaunchDefaults)

- (void)CP_registerDefaults;

@end
