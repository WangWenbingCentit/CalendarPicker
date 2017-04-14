//
//  Flag.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/2.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)flagWithDict:(NSDictionary *)dict;

@end
