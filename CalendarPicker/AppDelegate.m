//
//  AppDelegate.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/3/25.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "AppDelegate.h"
#import "UIMainViewController.h"
#import "NSUserDefaults+FirstLaunchDefaults.h"
#import "FirstlaunchManager.h"
#import "UILoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults CP_registerDefaults];
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    self.mianViewController = [[UIMainViewController alloc] init];
    
    self.window = window;
    
    if ([FirstlaunchManager sharedInstance].isFirstRun) {
        [self presentFirstlaunch];
    } else {
        [self presentTabInterface];
    }
    
    [window makeKeyAndVisible];
    
    
   // Override point for customization after application launch.
    return YES;
}

- (void)presentFirstlaunch
{
    [[FirstlaunchManager sharedInstance] setFirstRun:YES];
    UILoginViewController *loginVC = [[UILoginViewController alloc] init];
    self.window.rootViewController = loginVC;
}

- (void)presentTabInterface
{
    self.window.rootViewController = self.mianViewController;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
