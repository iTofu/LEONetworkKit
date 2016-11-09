# LEONetworkKit

[![Travis](https://img.shields.io/travis/iTofu/LEONetworkKit.svg?style=flat)](https://travis-ci.org/iTofu/LEONetworkKit)
[![CocoaPods](https://img.shields.io/cocoapods/v/LEONetworkKit.svg)](http://cocoadocs.org/docsets/LEONetworkKit)
[![CocoaPods](https://img.shields.io/cocoapods/l/LEONetworkKit.svg)](https://raw.githubusercontent.com/iTofu/LEONetworkKit/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/LEONetworkKit.svg)](http://cocoadocs.org/docsets/LEONetworkKit)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](http://leodev.me)

LEONetworkKit is a part of [LEOKit](https://github.com/iTofu/LEOKit). Have fun!


```
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
```

Welcome to my blog: http://LeoDev.me



<!-- **[中文介绍](https://github.com/iTofu/LEONetworkKit/blob/master/README_zh-CN.md)** -->




## Installation

LEONetworkKit is available on [CocoaPods](https://cocoapods.org/). Just add the following to your project Podfile:

```ruby
pod 'LEONetworkKit' # Podfile
```



## Non-CocoaPods Installation

Just drag the LEONetworkKit folder into your project.



## Usage

* In the `AppDelegate.m`:

	```objc
	#import "LEONetworkKit.h"

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	    // Override point for customization after application launch.
	    
	    [LEONetworkStatus startInternetNotifier];
	    
	    return YES;
	}
	```

* Get network status anywhere:

	```objc
	NetworkStatus status = [LEONetworkStatus status];
	
    NSLog(@"Network Status: %ld",  status);
	```

* Or you want observing network status changed notification:

	```objc
	// Notifications
	// Network status changed
	extern NSString *const kLEONetworkStatusChangedNotification;

	// Network toggle to not reachable
	extern NSString *const kLEONetworkNotReachableNotification;
	// Network toggle to WiFi
	extern NSString *const kLEONetworkReachableViaWiFiNotification;
	// Network toggle to WWAN (Cellular)
	extern NSString *const kLEONetworkReachableViaWWANNotification;


	// Add observer
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkStatusChanged:)
                                                 name:kLEONetworkStatusChangedNotification
                                               object:nil];
	

	// Handle net work status changed
	- (void)handleNetworkStatusChanged:(NSNotification *)noti {
	    Reachability *reach = noti.object;
	    NSParameterAssert([reach isKindOfClass:[Reachability class]]);
	    NetworkStatus status = reach.currentReachabilityStatus;
	    
	    NSLog(@"From Notification: %ld",  status);
	}
	```



## ChangeLog

### V 0.0.2

* Add network status changed notification:

	```objc
	// Network status changed
	extern NSString *const kLEONetworkStatusChangedNotification;
	```

### V 0.0.1

* Hello world!


## Thanks

* [Reachability](https://developer.apple.com/library/content/samplecode/Reachability)


## Support

* If you have any question, just [commit the issue](https://github.com/iTofu/LEONetworkKit/issues/new)! Thank you!

* Mail: devtip@163.com

* Blog: http://LeoDev.me



## License

[MIT License](http://opensource.org/licenses/MIT)
