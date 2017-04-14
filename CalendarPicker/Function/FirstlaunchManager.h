//
//  FirstlaunchManager.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface FirstlaunchManager : NSObject

@property (nonatomic, assign, readwrite, getter=isFirstRun) BOOL firstRun;

+ (instancetype)sharedInstance;

- (void)finish:(UIViewController *)parent;

@end
