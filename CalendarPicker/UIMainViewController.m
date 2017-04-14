//
//  UIMainViewController.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/4.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "UIMainViewController.h"
#import "UIMessageViewController.h"
#import "UIWorkViewController.h"
#import "UIContactViewController.h"
@interface UIMainViewController ()

@end

@implementation UIMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIMessageViewController *messageViewController = [[UIMessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageViewController];
    messageNav.title = @"消息";
    
    UIWorkViewController *workViewController = [[UIWorkViewController alloc] init];
    UINavigationController *workNav = [[UINavigationController alloc] initWithRootViewController:workViewController];
    workNav.title = @"工作";
    
    UIContactViewController *contactViewController = [[UIContactViewController alloc] init];
    UINavigationController *contactNav = [[UINavigationController alloc] initWithRootViewController:contactViewController];
    contactNav.title = @"通讯录";
    
    self.viewControllers = @[messageNav, workNav, contactNav];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
