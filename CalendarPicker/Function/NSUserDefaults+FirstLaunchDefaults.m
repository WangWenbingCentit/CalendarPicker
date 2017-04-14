
//
//  NSUserDefaults+FirstLaunchDefaults.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "NSUserDefaults+FirstLaunchDefaults.h"


NSString *kCompletedFirstRun = @"kCompletedFirstRun";

@implementation NSUserDefaults (FirstLaunchDefaults)

- (void)CP_registerDefaults
{
    NSDictionary *info = @{
                          kCompletedFirstRun : @(YES)
                           };
    [self registerDefaults:info];
}
@end
