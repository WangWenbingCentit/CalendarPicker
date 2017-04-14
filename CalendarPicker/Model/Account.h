//
//  Account.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@interface Account : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *accountName;
@property (nonatomic, strong) NSString *pwd;

@end
