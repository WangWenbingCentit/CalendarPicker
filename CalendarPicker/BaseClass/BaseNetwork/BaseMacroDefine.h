//
//  BaseMacroDefine.h
//  YC
//
//  Created by Gu GuiJun on 2017/3/3.
//  Copyright © 2017年 Gu GuiJun. All rights reserved.
//

#ifndef BaseMacroDefine_h
#define BaseMacroDefine_h

//#import "DeviceInfo.h"
//#import "UIColor_HexColor.h"
//#import"NSObject_IsVaildObject.h"
//#import "NSString_Formatter.h"
//#import "NSString+Hash.h"
//#import "UserInfo.h"
//#import "ECityTabBarController.h"
//#import "DateManager.h"

#define CalendarDaySelectNotifycation @"CalendarDaySelectNotifycation"

#define userDocumentPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"centit"]

#define iPhone6 ([UIScreen mainScreen].bounds.size.width == 375.0f && [UIScreen mainScreen].bounds.size.height == 667.0f) || ([UIScreen mainScreen].bounds.size.width == 667.0f && [UIScreen mainScreen].bounds.size.height == 375.0f)

#define ScreenWidth UIScreen.mainScreen.bounds.size.width
#define ScreenHeight UIScreen.mainScreen.bounds.size.height

//判断当前对象是否有效
#define isValid(object)     (object && ![object isEqual:[NSNull null]])
//color
#define RGBAColor(r, g, b, a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGBColor(r, g, b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#define alert(msg) {\
UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {\
[self dismissViewControllerAnimated:YES completion:nil];\
}];\
[alert addAction:action];\
[self presentViewController:alert animated:YES completion:nil];\
}

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define ServerAndPort @"http://106.15.39.61:8080/ycxmglpt/"

//#define ServerAndPort @"http://192.168.134.115:8080/ycxmglpt/"

#define PageTypePath @"service/phone/useroptstat"
#define DBPath @"service/project/projectsearch/listprojectissueinfo"
#define QZPath @"service/project/projectsearch/listprojectissueinfohelp"
#define GZPath @"service/project/projectsearch/listwatchissueinfo"
#define IssueDetailsPath @"service/project/projectissueinfo/getprojectissueinfo"
#define AnnexListPath @"service/project/projectoperate/listprojectannex"
#define WorkCommunicationPath @"service/project/projectoperate/listprojectmemo"
#define WorkRecordPath @"service/project/projectoperate/listprojectworklog"
#define SaveWorkCommunicationPath @"service/project/projectoperate/saveprojectmemo"
#define SaveWorkRecordPath @"service/project/projectoperate/saveprojectworklog"
#define SaveAnnexPath @"service/project/projectoperate/updateprojectannex"
#define IssueCompletePath @"service/project/projectoperate/updateprojectstate"

#define UploadAnnexPath @"http://106.15.39.61:8080/product-file/service/upload/file"

#endif /* BaseMacroDefine_h */
