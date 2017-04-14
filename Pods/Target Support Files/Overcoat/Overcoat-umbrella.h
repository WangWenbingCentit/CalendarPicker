#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSDictionary+Overcoat.h"
#import "NSError+OVCResponse.h"
#import "OVCHTTPRequestOperationManager.h"
#import "OVCHTTPSessionManager.h"
#import "OVCManagedObjectSerializingContainer.h"
#import "OVCManagedStore.h"
#import "OVCModelResponseSerializer.h"
#import "OVCResponse.h"
#import "OVCSocialRequestSerializer.h"
#import "OVCURLMatcher.h"
#import "Overcoat.h"
#import "OVCHTTPSessionManager.h"
#import "OVCHTTPRequestOperationManager+PromiseKit.h"
#import "OVCHTTPSessionManager+PromiseKit.h"
#import "PromiseKit+Overcoat.h"

FOUNDATION_EXPORT double OvercoatVersionNumber;
FOUNDATION_EXPORT const unsigned char OvercoatVersionString[];

