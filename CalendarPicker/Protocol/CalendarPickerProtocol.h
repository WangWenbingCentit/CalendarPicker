//
//  CalendarPickerProtocol.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/3.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PromiseKit/PromiseKit.h>

@protocol LoginProtocol <NSObject>

- (PMKPromise *)loginWithName:(NSString *)name password:(NSString *)pwd;

- (PMKPromise *)projectList:(NSString *)parameter;

@end

@protocol ProjectListProtocol <NSObject>

- (PMKPromise *)projectList;

@end
