//
//  LoginSessionManager.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/3.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "LoginSessionManager.h"
#import "BaseMacroDefine.h"

@implementation LoginSessionManager

+ (instancetype)sharedInstanceSession
{
    static LoginSessionManager *loginSessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *defaultsConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        loginSessionManager = [[self alloc] initWithBaseURL:nil managedObjectContext:nil sessionConfiguration:defaultsConfiguration];
    });
    [LoginSessionManager reachabilityManager];
    return loginSessionManager;
}
- (PMKPromise *)loginWithName:(NSString *)name password:(NSString *)pwd
{
    [self.requestSerializer setTimeoutInterval:10];
    
    NSString *urlstring = [[NSString stringWithFormat:@"login?ajax=true&username=%@&password=%@",name,pwd] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    PMKPromise *promise = [self POST:urlstring parameters:@""].then(^(OVCResponse *respone){
    }).catch(^(NSError *error){
    });
    return promise;
}

#define projectPath   @"service/project/projectsearch/listprojectinfo"

- (PMKPromise *)projectList:(NSString *)parameter
{
    NSString  *urlString = nil;
    [self.requestSerializer setTimeoutInterval:10];
    
    urlString = [ServerAndPort stringByAppendingString:projectPath];
    urlString = [urlString stringByAppendingPathComponent:parameter];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    PMKPromise *promise = [self GET:urlString parameters:@{}].then(^(OVCResponse *response){
        
        return response;
        
    }).catch(^(NSError *error) {
        
        return error;
        
    });
    
    return promise;
}
@end
