//
//  LCAppDelegate.m
//  LiftCountdown
//
//  Created by luo plus on 14-7-3.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCAppDelegate.h"
#import "LCBirthDayViewController.h"
#import "LCLifeTimeViewController.h"
#import "LCAgeViewController.h"
#import "LCDefine.h"
#import "MMDeviceInfo.h"


@implementation LCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	self.navController = [[UINavigationController alloc] init];
	[self.window addSubview:self.navController.view];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoRootView) name:NOTIFY_GOTOROOTVIEW object:nil];
	
	[self initUI];
    
    [self registRemotePush];

    return YES;
}

- (void)initUI
{
	self.mEndTimeInterval = [[NSUserDefaults standardUserDefaults] floatForKey:ENDTIME_KEY];
	
	NSInteger nState = [[NSUserDefaults standardUserDefaults] integerForKey:APP_STATE_KEY];
	if (nState == APP_STATE_ENTER) {
		LCBirthDayViewController* settingViewController = [[LCBirthDayViewController alloc] init];
		[self.navController pushViewController:settingViewController animated:NO];
		LCLifeTimeViewController* lifeTimeViewController = [[LCLifeTimeViewController alloc] init];
		[self.navController pushViewController:lifeTimeViewController animated:NO];
	}else{
		LCBirthDayViewController* settingViewController = [[LCBirthDayViewController alloc] init];
		[self.navController pushViewController:settingViewController animated:NO];
	}
}

- (void)registRemotePush
{
#ifdef __IPHONE_8_0
    if([MMDeviceInfo isiOS8plus])
    {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
        {
            UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
        else
        {
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        }
        
        return;
    }
#endif
    
    // push
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
                                                                           UIRemoteNotificationTypeSound |
                                                                           UIRemoteNotificationTypeBadge)];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//	[self startLocalPush];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)startLocalPush
{
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
	[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
	
	UILocalNotification *notification = [[UILocalNotification alloc] init];
	notification.alertBody = @"你的生命 又过了一天";
	notification.soundName = UILocalNotificationDefaultSoundName;
	notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
	notification.timeZone = [NSTimeZone defaultTimeZone];
	notification.applicationIconBadgeNumber = 1;
	notification.repeatInterval = NSCalendarUnitDay;
	[[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)gotoRootView
{
	[self.navController popToRootViewControllerAnimated:YES];
}

@end
