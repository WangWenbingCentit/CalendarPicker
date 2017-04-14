//
//  FirstlaunchManager.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "FirstlaunchManager.h"
#import "NSUserDefaults+FirstLaunchDefaults.h"

@interface FirstlaunchManager ()

@end
@implementation FirstlaunchManager

+ (instancetype)sharedInstance
{
    static FirstlaunchManager *launchManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        launchManager = [[self alloc] init];
    });
    return launchManager;
}

- (void)setFirstRun:(BOOL)firstRun
{
    [[NSUserDefaults standardUserDefaults] setBool:firstRun forKey:kCompletedFirstRun];
}

- (BOOL)isFirstRun
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kCompletedFirstRun];
}

- (void)finish:(UIViewController *)parent
{
    
}
@end
