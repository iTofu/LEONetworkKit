//
//  LEONetworkStatus.m
//  LEONetworkKit
//
//  Created by Leo on 2016/11/9.
//  Copyright © 2016年 Leo. All rights reserved.
//
//  GitHub: http://github.com/iTofu
//  Mail:   mailto:devtip@163.com
//

#import "LEONetworkStatus.h"


// Network status changed
NSString *const kLEONetworkStatusChangedNotification    = @"LEONetworkStatusChangedNotification";

// Network toggle to not reachable
NSString *const kLEONetworkNotReachableNotification     = @"LEONetworkNotReachableNotification";
// Network toggle to WiFi
NSString *const kLEONetworkReachableViaWiFiNotification = @"LEONetworkReachableViaWiFiNotification";
// Network toggle to WWAN (Cellular)
NSString *const kLEONetworkReachableViaWWANNotification = @"LEONetworkReachableViaWWANNotification";


@interface LEONetworkStatus ()

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;

@end

@implementation LEONetworkStatus

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kReachabilityChangedNotification
                                                  object:nil];
}

+ (instancetype)shared {
    static LEONetworkStatus *sharedNetworkStatus = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetworkStatus = [[LEONetworkStatus alloc] init];
    });
    return sharedNetworkStatus;
}

+ (void)startInternetNotifier {
    [[self shared] startInternetNotifier];
}

+ (void)startHostNotifier {
    [[self shared] startHostNotifier];
}

+ (NetworkStatus)status {
    return [[self shared] status];
}

- (instancetype)init {
    if (self = [super init]) {
        self.status = NotReachable;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
    }
    return self;
}

- (void)startInternetNotifier {
    self.internetReachability =
    [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    
    self.status = self.internetReachability.currentReachabilityStatus;
}

- (void)startHostNotifier {
    self.hostReachability =
    [Reachability reachabilityWithHostName:self.hostName];
    [self.hostReachability startNotifier];
}

- (void)reachabilityChanged:(NSNotification *)noti {
    Reachability *curReach = noti.object;
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    
    [self handleReachabilityChanged:curReach];
}

- (void)handleReachabilityChanged:(Reachability *)reachability {
    NetworkStatus networkStatus = reachability.currentReachabilityStatus;
    
    switch (networkStatus) {
        case NotReachable: {
            self.status = NotReachable;
            [[NSNotificationCenter defaultCenter] postNotificationName:kLEONetworkStatusChangedNotification
                                                                object:reachability];
            [[NSNotificationCenter defaultCenter] postNotificationName:kLEONetworkNotReachableNotification
                                                                object:reachability];
            break;
        }
        case ReachableViaWiFi: {
            self.status = ReachableViaWiFi;
            [[NSNotificationCenter defaultCenter] postNotificationName:kLEONetworkStatusChangedNotification
                                                                object:reachability];
            [[NSNotificationCenter defaultCenter] postNotificationName:kLEONetworkReachableViaWiFiNotification
                                                                object:reachability];
            break;
        }
        case ReachableViaWWAN: {
            self.status = ReachableViaWWAN;
            [[NSNotificationCenter defaultCenter] postNotificationName:kLEONetworkStatusChangedNotification
                                                                object:reachability];
            [[NSNotificationCenter defaultCenter] postNotificationName:kLEONetworkReachableViaWWANNotification
                                                                object:reachability];
            break;
        }
    }
}

@end
