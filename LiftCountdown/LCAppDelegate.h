//
//  LCAppDelegate.h
//  LiftCountdown
//
//  Created by luo plus on 14-7-3.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property (assign, nonatomic) NSTimeInterval mEndTimeInterval;
@property (assign, nonatomic) NSDate* mBirthDay;

@end
