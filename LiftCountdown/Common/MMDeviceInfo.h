//
//  MMDeviceInfo.h
//  MicroMessenger
//
//  Created by  kenbin on 11-6-14.
//  Copyright 2011 Tecent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIDevice (Hardware)

+ (NSString *) getSysInfoByName:(char *)typeSpeifier;
+ (int) getSysInfo:(uint)typeSpecifier;
- (NSString *) platform;
- (int) cpuCount;
- (int) cpuFrequency;
- (int) busFrequency;
- (int) totalMemory;
- (int) userMemory;
- (int) cacheLine;
- (int) L1ICacheSize;
- (int) L1DCacheSize;
- (int) L2CacheSize;
- (int) L3CacheSize;

@end

@interface MMDeviceInfo : NSObject {
    
}

+ (NSString *) modelPlatform;
+ (NSString *) DModel;
+ (NSString *) DSystem;
+ (NSString *) DCPU;
+ (NSString *) DMemory;
+ (NSString *) DBus;
+ (NSString *) DCache;
+ (CGFloat) TotalDiskSpaceSize;
+ (CGFloat) FreeDiskSpaceSize;

+ (BOOL) isiPhone;
+ (BOOL) isiPhone2G;
+ (BOOL) isiPhone3G;
+ (BOOL) isiPhone3GS;
+ (BOOL) isiPhone4;
+ (BOOL) isiPhone4S;
+ (BOOL) isiPhone5;
+ (BOOL) isiPhone5S;
+ (BOOL) isiPhone5C;
+ (BOOL) isiPodTouch;
+ (BOOL) isiPodTouch1;
+ (BOOL) isiPodTouch2;
+ (BOOL) isiPodTouch3;
+ (BOOL) isiPodTouch4;
+ (BOOL) isiPodTouch5;
+ (BOOL) isiPad;
+ (BOOL) isiPad1;
+ (BOOL) isiPad2;
+ (BOOL) isiPad3;
+ (BOOL) isiPad4;
+ (BOOL) isiPadMini;

+ (BOOL) isiOS7_1plus;
+ (BOOL) isiOS8plus;
+ (BOOL) isiOS7plus;
+ (BOOL) isiOS6plus;
+ (BOOL) isiOS6_1plus;
+ (BOOL) isiOS5_1plus;
+ (BOOL) isiOS5plus;

+ (BOOL) is568hScreen;
//added by lgg
+ (BOOL) is320wScreen;
+ (BOOL) is480hScreen;//iphone 4/4s/3g

+ (BOOL) is375wScreen;//iphone 6
+ (BOOL) is667hScreen;

+ (BOOL) is414wScreen;//iphone 6+
+ (BOOL) is736hScreen;


@end
