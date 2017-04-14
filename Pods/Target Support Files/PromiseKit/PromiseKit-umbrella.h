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

#import "ACAccountStore+PromiseKit.h"
#import "AVAudioSession+PromiseKit.h"
#import "CALayer+PromiseKit.h"
#import "CKContainer+PromiseKit.h"
#import "CKDatabase+PromiseKit.h"
#import "CLGeocoder+PromiseKit.h"
#import "CLLocationManager+PromiseKit.h"
#import "Promise+Hang.h"
#import "Promise+Join.h"
#import "MKDirections+PromiseKit.h"
#import "MKMapSnapshotter+PromiseKit.h"
#import "NSFileManager+PromiseKit.h"
#import "NSNotificationCenter+PromiseKit.h"
#import "NSURLConnection+PromiseKit.h"
#import "Promise+Pause.h"
#import "PromiseKit.h"
#import "Promise.h"
#import "fwd.h"
#import "SKRequest+PromiseKit.h"
#import "SLRequest+PromiseKit.h"
#import "UIActionSheet+PromiseKit.h"
#import "UIAlertView+PromiseKit.h"
#import "UIView+PromiseKit.h"
#import "UIViewController+PromiseKit.h"
#import "Promise+Until.h"
#import "Promise+When.h"

FOUNDATION_EXPORT double PromiseKitVersionNumber;
FOUNDATION_EXPORT const unsigned char PromiseKitVersionString[];

