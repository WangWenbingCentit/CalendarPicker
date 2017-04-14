//
//  BaseSessionManager.m
//  CalendarPicker
//
//  Created by 陈共义 on 2017/4/3.
//  Copyright © 2017年 Centit, lnc. All rights reserved.
//

#import "BaseSessionManager.h"
#import "BaseMacroDefine.h"
@implementation BaseSessionManager

+ (AFNetworkReachabilityManager *)reachabilityManager
{
    static AFNetworkReachabilityManager *sharedReachabilityManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedReachabilityManager = [AFNetworkReachabilityManager managerForDomain:@"www.centit.com"]  ;
        [sharedReachabilityManager startMonitoring];
    });
    
    return sharedReachabilityManager;
}

+ (Class)responseClass
{
    return [OVCResponse class];
}

+ (NSDictionary *)modelClassesByResourcePath
{
    return @{};
}


- (instancetype)initWithBaseURL:(NSURL *)url
           managedObjectContext:(NSManagedObjectContext *)context
           sessionConfiguration:(NSURLSessionConfiguration *)configuration;
{
    if (!url) {
        // For now we are only going to be using the staging server
        url = [NSURL URLWithString:ServerAndPort];
        
    }
    
    // Super is Overcoat class
    self = [super initWithBaseURL:url managedObjectContext:context sessionConfiguration:configuration];
    
    if (self) {
        
        // All requests are JSON too
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        // Caching requests is turned of to allow for easy changes on the website endpoints and it can be turned on once the endpoints are stable
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        // All responses are JSON
        NSArray *contentTypes = @[@"application/json", @"text/plain",@"text/html",@"multipart/form-data"];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithArray:contentTypes];
        
        [self setReachabilityManager:[self reachabilityManager]];
        
    }
    return self;
}
@end
