//
//  Flag.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/2.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "Flag.h"

@implementation Flag

+ (instancetype)flagWithDict:(NSDictionary *)dict
{
    Flag *flag = [[self alloc] init];
    [flag setValuesForKeysWithDictionary:dict];
    return flag;
}
@end
