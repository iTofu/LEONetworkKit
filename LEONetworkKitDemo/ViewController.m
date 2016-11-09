//
//  ViewController.m
//  LEONetworkKitDemo
//
//  Created by Leo on 2016/11/9.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LEONetworkKit.h"

static NSString *LEONetworkStatusDes[] = {
    @"Not Reachable",
    @"Reachable Via WiFi",
    @"Reachable Via WWAN"
};

@interface ViewController ()

@property (nonatomic, weak) UILabel *desLabel;

@end

@implementation ViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *desLabel      = [[UILabel alloc] init];
    desLabel.font          = [UIFont systemFontOfSize:17.0f];
    desLabel.textAlignment = NSTextAlignmentCenter;
    desLabel.frame         = CGRectMake(0, 74, self.view.bounds.size.width, 20.0f);
    [self.view addSubview:desLabel];
    self.desLabel          = desLabel;
    
    desLabel.text = @"Please change network now";
    
    
    // 1. You could observing all network status changed notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkStatusChanged:)
                                                 name:kLEONetworkStatusChangedNotification
                                               object:nil];
    
    /*
    // 2. Or you could observing one of notifications what you care
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkNotReachable:)
                                                 name:kLEONetworkNotReachableNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkReachableViaWiFi:)
                                                 name:kLEONetworkReachableViaWiFiNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkReachableViaWWAN:)
                                                 name:kLEONetworkReachableViaWWANNotification
                                               object:nil];
     */
}

- (void)handelNetworkStatusChanged {
    NSString *status = LEONetworkStatusDes[[LEONetworkStatus status]];
    
    NSLog(@"Network Status: %@", self.desLabel.text = status);
}

#pragma mark - Handle Notification

- (void)handleNetworkStatusChanged:(NSNotification *)noti {
    // Use `[LEONetworkStatus status]` - Fast Way!
    [self handelNetworkStatusChanged];
    
    // Use Notification
    Reachability *reach = noti.object;
    NSParameterAssert([reach isKindOfClass:[Reachability class]]);
    NetworkStatus status = reach.currentReachabilityStatus;
    
    NSLog(@"From Notification: %@\n---",  LEONetworkStatusDes[status]);
}


- (void)handleNetworkNotReachable:(NSNotification *)noti {
    // Use `[LEONetworkStatus status]` - Fast Way!
    [self handelNetworkStatusChanged];
    
    // Use Notification
    Reachability *reach = noti.object;
    NSParameterAssert([reach isKindOfClass:[Reachability class]]);
    NetworkStatus status = reach.currentReachabilityStatus;
    
    NSLog(@"From Notification: %@\n---",  LEONetworkStatusDes[status]);
}

- (void)handleNetworkReachableViaWiFi:(NSNotification *)noti {
    // Use `[LEONetworkStatus status]` - Fast Way!
    [self handelNetworkStatusChanged];
    
    // Use Notification
    Reachability *reach = noti.object;
    NSParameterAssert([reach isKindOfClass:[Reachability class]]);
    NetworkStatus status = reach.currentReachabilityStatus;
    
    NSLog(@"From Notification: %@\n---",  LEONetworkStatusDes[status]);
}

- (void)handleNetworkReachableViaWWAN:(NSNotification *)noti {
    // Use `[LEONetworkStatus status]` - Fast Way!
    [self handelNetworkStatusChanged];
    
    // Use Notification
    Reachability *reach = noti.object;
    NSParameterAssert([reach isKindOfClass:[Reachability class]]);
    NetworkStatus status = reach.currentReachabilityStatus;
    
    NSLog(@"From Notification: %@\n---",  LEONetworkStatusDes[status]);
}


@end
