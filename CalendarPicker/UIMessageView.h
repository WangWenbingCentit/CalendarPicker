//
//  UIMessageView.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/2.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface UIMessageView : UIView

@property (nonatomic, strong) RACSubject *btnSingal;

- (IBAction)buttonClick:(id)sender;


@end
