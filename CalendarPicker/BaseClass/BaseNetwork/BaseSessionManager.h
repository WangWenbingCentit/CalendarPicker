//
//  BaseSessionManager.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/3.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//
#import <Overcoat/Overcoat.h>
#import <Foundation/Foundation.h>
#import <Overcoat/PromiseKit+Overcoat.h>
@interface BaseSessionManager : OVCHTTPSessionManager

+ (AFNetworkReachabilityManager *)reachabilityManager;

@end
