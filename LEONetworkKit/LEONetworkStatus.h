//
//  LEONetworkStatus.h
//  LEONetworkKit
//
//  Created by Leo on 2016/11/9.
//  Copyright © 2016年 Leo. All rights reserved.
//
//  GitHub: http://github.com/iTofu
//  Mail:   mailto:devtip@163.com
//

#import <Foundation/Foundation.h>
#import "Reachability.h" // Version 5.0, 2016-05-05


// Network toggle to not reachable
extern NSString *const kLEONetworkNotReachableNotification;
// Network toggle to WiFi
extern NSString *const kLEONetworkReachableViaWiFiNotification;
// Network toggle to WWAN (Cellular)
extern NSString *const kLEONetworkReachableViaWWANNotification;


@interface LEONetworkStatus : NSObject

/**
 Network status.
 */
@property (nonatomic, assign) NetworkStatus status;

/**
 Host name.
 */
@property (nonatomic, copy) NSString *hostName;

///**
// LEONetworkStatus shared instance.
// */
//+ (instancetype)shared;

/**
 Start internet notifier.
 */
+ (void)startInternetNotifier;

///**
// Start host notifier.
// You should set `hostName` first!
// */
//+ (void)startHostNotifier;

/**
 Network status.
 */
+ (NetworkStatus)status;

///**
// Start internet notifier.
// */
//- (void)startInternetNotifier;
//
///**
// Start host notifier.
// You should set `hostName` first!
// */
//- (void)startHostNotifier;

@end
