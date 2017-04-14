//
//  UIMessageView.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/2.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "UIMessageView.h"

@interface UIMessageView ()

@end

@implementation UIMessageView

- (RACSubject *)btnSingal
{
    if ( !_btnSingal) {
        _btnSingal = [RACSubject subject];
    }
    return _btnSingal;
}

- (IBAction)buttonClick:(id)sender
{
    [_btnSingal sendNext:@"这个按钮被点击了"];
}

@end
