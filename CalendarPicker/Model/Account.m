//
//  Account.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "Account.h"

@implementation Account

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"accountName" : @"accountName",
             @"pwd" : @"pwd"
             };
}
@end
