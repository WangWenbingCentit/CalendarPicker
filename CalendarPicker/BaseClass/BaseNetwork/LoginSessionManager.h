//
//  LoginSessionManager.h
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/3.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "BaseSessionManager.h"
#import "CalendarPickerProtocol.h"
@interface LoginSessionManager : BaseSessionManager

+ (instancetype)sharedInstanceSession;


@end

@interface LoginSessionManager (LoginSessionProtocol)<LoginProtocol>

@end
