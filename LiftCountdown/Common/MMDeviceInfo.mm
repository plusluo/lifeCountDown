//
//  DeviceInfo.mm
//  MatteCamera
//
//  Created by  kenbin on 12-1-4.
//  Copyright 2012 tencent. All rights reserved.
//

#include <sys/sysctl.h>
#include <sys/mount.h>

#import "MMDeviceInfo.h"

@implementation UIDevice (Hardware)

+ (NSString *) getSysInfoByName:(char *)typeSpeifier {
	size_t size;
	sysctlbyname(typeSpeifier, NULL, &size, NULL, 0);
	char *answer = (char *)malloc(size);
	sysctlbyname(typeSpeifier, answer, &size, NULL, 0);
	NSString *results = [NSString stringWithCString:answer encoding:NSUTF8StringEncoding];
	free(answer);
	return results;
}

+ (int) getSysInfo:(uint) typeSpecifier {
	size_t size = sizeof(int);
	int results;
	int mib[2] = {CTL_HW, (int)typeSpecifier};
	sysctl(mib, 2, &results, &size, NULL, 0);
	return results;
}

- (NSString *) platform {
	return [UIDevice getSysInfoByName:(char*)"hw.machine"];
}

- (int) cpuCount {
    return [UIDevice getSysInfo:HW_NCPU];
}

- (int) cpuFrequency {
    return [UIDevice getSysInfo:HW_CPU_FREQ];
}

- (int) busFrequency {
	return [UIDevice getSysInfo:HW_BUS_FREQ];
}

- (int) totalMemory {
	return [UIDevice getSysInfo:HW_PHYSMEM];
}

- (int) userMemory {
	return [UIDevice getSysInfo:HW_USERMEM];
}

- (int) cacheLine {
    return [UIDevice getSysInfo:HW_CACHELINE];
}

- (int) L1ICacheSize {
    return [UIDevice getSysInfo:HW_L1ICACHESIZE];
}

- (int) L1DCacheSize {
    return [UIDevice getSysInfo:HW_L1DCACHESIZE];
}

- (int) L2CacheSize {
    return [UIDevice getSysInfo:HW_L2CACHESIZE];
}

- (int) L3CacheSize {
    return [UIDevice getSysInfo:HW_L3CACHESIZE];
}

@end

@implementation MMDeviceInfo

+ (NSString *) modelPlatform
{
	return [UIDevice currentDevice].platform;
}

+ (NSString *) DModel {
	NSString *nsModel = nil;
	NSString *nsPlatForm = [UIDevice currentDevice].platform;
	if ([nsPlatForm hasPrefix:@"iPhone1,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone(WiFi,GSM)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone1,2"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 3G(WiFi,GSM,WCDMA)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone2,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 3GS(WiFi,GSM,WCDMA)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone3,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 4(WiFi,GSM,WCDMA)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone3,2"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 4 Proto(WiFi,GSM,WCDMA,CDMA2000)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone3,3"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 4(WiFi,GSM,WCDMA,CDMA2000)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone4,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 4S(WiFi,GSM,WCDMA,CDMA2000)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone5,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 5(WiFi,GSM,WCDMA,LTE)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPhone5,2"])
    {
		nsModel = [NSString stringWithFormat:@"iPhone 5(WiFi,GSM,WCDMA,CDMA2000,LTE)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPod1,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPod Touch 1th(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPod2,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPod Touch 2th(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPod3,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPod Touch 3th(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPod4,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPod Touch 4th(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPod5,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPod Touch 5th(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad1,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPad(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad1,2"])
    {
		nsModel = [NSString stringWithFormat:@"iPad(WiFi,GSM,WCDMA)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad2,1"])
    {
		nsModel = [NSString stringWithFormat:@"iPad 2(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad2,2"])
    {
		nsModel = [NSString stringWithFormat:@"iPad 2(WiFi,GSM,WCDMA)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad2,3"])
    {
		nsModel = [NSString stringWithFormat:@"iPad 2(WiFi,CDMA2000)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad3,1"])
    {
		nsModel = [NSString stringWithFormat:@"new iPad 3(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad3,2"])
    {
		nsModel = [NSString stringWithFormat:@"new iPad 3(WiFi,GSM,WCDMA,LTE)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad3,3"])
    {
		nsModel = [NSString stringWithFormat:@"new iPad 3(WiFi,GSM,WCDMA,CDMA2000,LTE)<%@>", nsPlatForm];
	}
	else if ([nsPlatForm hasPrefix:@"iPad3,4"])
    {
		nsModel = [NSString stringWithFormat:@"new iPad 4(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad3,5"])
    {
		nsModel = [NSString stringWithFormat:@"new iPad 4(WiFi,GSM,WCDMA,LTE)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad3,6"])
    {
		nsModel = [NSString stringWithFormat:@"new iPad 4(WiFi,GSM,WCDMA,CDMA2000,LTE)<%@>", nsPlatForm];
	}
	else if ([nsPlatForm hasPrefix:@"iPad2,5"])
    {
		nsModel = [NSString stringWithFormat:@"iPad mini(WiFi)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad2,6"])
    {
		nsModel = [NSString stringWithFormat:@"iPad mini(WiFi,GSM,WCDMA,LTE)<%@>", nsPlatForm];
	}
    else if ([nsPlatForm hasPrefix:@"iPad2,7"])
    {
		nsModel = [NSString stringWithFormat:@"iPad mini(WiFi,GSM,WCDMA,CDMA2000,LTE)<%@>", nsPlatForm];
	}
    else
    {
		nsModel = [NSString stringWithFormat:@"unknown<%@>", nsPlatForm];
	}
	
	return nsModel;
}

+ (NSString *) DSystem {
	NSString *nsSystem = [NSString stringWithFormat:@"%@ %@",
						  [UIDevice currentDevice].systemName,
						  [UIDevice currentDevice].systemVersion];
	return nsSystem;
}

+ (NSString *) DCPU {
    // 很多设备不能获取cpu频率
    //int cpu_freq = [UIDevice currentDevice].cpuFrequency / 1000 / 1000;
    NSString *nsCpuSpeed = nil;
    if ([MMDeviceInfo isiPhone2G]) {
        nsCpuSpeed = @"clock:412MHz(max:620MHz),ARMV6";
    } else if ([MMDeviceInfo isiPhone3G]) {
        nsCpuSpeed = @"clock:412MHz(max:620MHz),ARMV6";
    } else if ([MMDeviceInfo isiPhone3GS]) {
        nsCpuSpeed = @"clock:600MHz(max:833MHz),ARMV7";
    } else if ([MMDeviceInfo isiPhone4]) {
        nsCpuSpeed = @"clock:800MHz(max:1GHz),ARMV7,A4";
    } else if ([MMDeviceInfo isiPhone4S]) {
        nsCpuSpeed = @"clock:800MHz(max:1GHz),ARMV7,A5";
    } else if ([MMDeviceInfo isiPhone5]) {
        nsCpuSpeed = @"clock:1.3GHz(max:1.3GHz),ARMV7s,A6";
    }
    
    else if ([MMDeviceInfo isiPodTouch1]) {
        nsCpuSpeed = @"clock:412MHz(max:620MHz),ARMV6";
    } else if ([MMDeviceInfo isiPodTouch2]) {
        nsCpuSpeed = @"clock:412MHz(max:620MHz),ARMV6";
    } else if ([MMDeviceInfo isiPodTouch3]) {
        nsCpuSpeed = @"clock:600MHz(max:833MHz),ARMV7";
    } else if ([MMDeviceInfo isiPodTouch4]) {
        nsCpuSpeed = @"clock:800MHz(max:1GHz),ARMV7,A4";
    } else if ([MMDeviceInfo isiPodTouch5]) {
        nsCpuSpeed = @"clock:800MHz(max:1GHz),ARMV7,A5";
    }
    
    else if ([MMDeviceInfo isiPad1]) {
        nsCpuSpeed = @"clock:1GHz(max:1GHz),ARMV7,A4";
    } else if ([MMDeviceInfo isiPad2]) {
        nsCpuSpeed = @"clock:1GHz(max:1GHz),ARMV7,A5";
    } else if ([MMDeviceInfo isiPad3]) {
        nsCpuSpeed = @"clock:1GHz(max:1GHz),ARMV7,A5X";
    } else if ([MMDeviceInfo isiPad4]) {
    	nsCpuSpeed = @"clock:1.4GHz(max:1.4GHz),ARMV7s,A6X";
    } else if ([MMDeviceInfo isiPadMini]) {
    	nsCpuSpeed = @"clock:1GHz(max:1GHz),ARMV7,A5";
    }
    
	NSString *nsCPU = [NSString stringWithFormat:@"%dcore %@",
                       [UIDevice currentDevice].cpuCount, nsCpuSpeed];
    
	return nsCPU;
}

+ (NSString *) DMemory {
    // 数据传输速度是时钟频率的两倍，因为DDR在时钟的上升沿和下降沿都会传输数据
    NSString *nsMemSpeed = nil;
    if ([MMDeviceInfo isiPhone2G]) {
        nsMemSpeed = @"clock:133MHz,LPDDR,16bit";
    } else if ([MMDeviceInfo isiPhone3G]) {
        nsMemSpeed = @"clock:133MHz,LPDDR,16bit";
    } else if ([MMDeviceInfo isiPhone3GS]) {
        nsMemSpeed = @"clock:200MHz,LPDDR,32bit";
    } else if ([MMDeviceInfo isiPhone4]) {
        nsMemSpeed = @"clock:200MHz,LPDDR,2*32bit";
    } else if ([MMDeviceInfo isiPhone4S]) {
        nsMemSpeed = @"clock:400MHz,LPDDR2,2*32bit";
    } else if ([MMDeviceInfo isiPhone5]) {
        nsMemSpeed = @"clock:533MHz,LPDDR2,2*32bit";
    }
    
    else if ([MMDeviceInfo isiPodTouch1]) {
        nsMemSpeed = @"clock:133MHz,LPDDR,16bit";
    } else if ([MMDeviceInfo isiPodTouch2]) {
        nsMemSpeed = @"clock:133MHz,LPDDR,16bit";
    } else if ([MMDeviceInfo isiPodTouch3]) {
        nsMemSpeed = @"clock:200MHz,LPDDR,32bit";
    } else if ([MMDeviceInfo isiPodTouch4]) {
        nsMemSpeed = @"clock:200MHz,LPDDR,2*32bit";
    } else if ([MMDeviceInfo isiPodTouch5]) {
        nsMemSpeed = @"clock:400MHz,LPDDR2,2*32bit";
    }
    
    else if ([MMDeviceInfo isiPad1]) {
        nsMemSpeed = @"clock:200MHz,LPDDR,2*32bit";
    } else if ([MMDeviceInfo isiPad2]) {
        nsMemSpeed = @"clock:400MHz,LPDDR2,2*32bit";
    } else if ([MMDeviceInfo isiPad3]) {
        nsMemSpeed = @"clock:400MHz,LPDDR2,4*32bit";
    } else if ([MMDeviceInfo isiPad4]) {
    	nsMemSpeed = @"clock:533MHz,LPDDR2,4*32bit";
    } else if ([MMDeviceInfo isiPadMini]) {
    	nsMemSpeed = @"clock:400MHz,LPDDR2,2*32bit";
    }
    
	NSString *nsMemory = [NSString stringWithFormat:@"%dM(user:%dM) %@",
						  [UIDevice currentDevice].totalMemory / 1024 / 1024,
						  [UIDevice currentDevice].userMemory / 1024 / 1024, nsMemSpeed];
	return nsMemory;
}

+ (NSString *) DBus {
    // 很多设备不能获取总线频率
    //int bus_freq = [UIDevice currentDevice].busFrequency / 1000 / 1000;
    
    /*
     前端总线频率（system clock）是一个基准频率，一般cpu主频是前端总线频率的整数倍，
     DDR的频率可以小于前端总线频率也可以大于它，不同的处理器架构有不同的倍率
     */
    
    NSString *nsBusSpeed = nil;
    if ([MMDeviceInfo isiPhone2G]) {
        nsBusSpeed = @"32bit-wide clock:103MHz";
    } else if ([MMDeviceInfo isiPhone3G]) {
        nsBusSpeed = @"32bit-wide clock:103MHz";
    } else if ([MMDeviceInfo isiPhone3GS]) {
        nsBusSpeed = @"32bit-wide clock:100MHz";
    } else if ([MMDeviceInfo isiPhone4]) {
        nsBusSpeed = @"64bit-wide clock:100MHz";
    } else if ([MMDeviceInfo isiPhone4S]) {
        nsBusSpeed = @"64bit-wide clock:200MHz";
    } else if ([MMDeviceInfo isiPhone5]) {
        nsBusSpeed = @"64bit-wide clock:?MHz";
    }
    
    else if ([MMDeviceInfo isiPodTouch1]) {
        nsBusSpeed = @"32bit-wide clock:103MHz";
    } else if ([MMDeviceInfo isiPodTouch2]) {
        nsBusSpeed = @"32bit-wide clock:103MHz";
    } else if ([MMDeviceInfo isiPodTouch3]) {
        nsBusSpeed = @"32bit-wide clock:100MHz";
    } else if ([MMDeviceInfo isiPodTouch4]) {
        nsBusSpeed = @"64bit-wide clock:100MHz";
    } else if ([MMDeviceInfo isiPodTouch5]) {
        nsBusSpeed = @"64bit-wide clock:200MHz";
    }
    
    else if ([MMDeviceInfo isiPad1]) {
        nsBusSpeed = @"64bit-wide clock:100MHz";
    } else if ([MMDeviceInfo isiPad2]) {
        nsBusSpeed = @"64bit-wide clock:250MHz";
    } else if ([MMDeviceInfo isiPad3]) {
        nsBusSpeed = @"64bit-wide clock:250MHz";
    } else if ([MMDeviceInfo isiPad4]) {
        nsBusSpeed = @"64bit-wide clock:?MHz";
    } else if ([MMDeviceInfo isiPadMini]) {
        nsBusSpeed = @"64bit-wide clock:?MHz";
    }
    
    NSString *nsBus = [NSString stringWithFormat:@"%@", nsBusSpeed];
    return nsBus;
}

+ (NSString *) DCache {
	NSString *nsCache = [NSString stringWithFormat:@"line:%d L1(I):%dK L1(D):%dK L2:%dK",
                         [UIDevice currentDevice].cacheLine,
                         [UIDevice currentDevice].L1ICacheSize / 1024,
                         [UIDevice currentDevice].L1DCacheSize / 1024,
                         [UIDevice currentDevice].L2CacheSize / 1024];
	return nsCache;
}

+ (CGFloat) TotalDiskSpaceSize {
    CGFloat totalSpace = -1;
    struct statfs stat;
    if(statfs("var/", &stat) >= 0){
        totalSpace = (float)(stat.f_blocks * stat.f_bsize);
    }
    
    return totalSpace;
}

+ (CGFloat) FreeDiskSpaceSize {
    CGFloat freeSpace = -1;
    struct statfs stat;
    if(statfs("var/", &stat) >= 0){
        freeSpace = (float)(stat.f_bsize * stat.f_bfree);
    }
    
    return freeSpace;
}

+ (BOOL) isiPhone {
	NSString *nsModel = [UIDevice currentDevice].model;
	return [nsModel hasPrefix:@"iPhone"];
}

+ (BOOL) isiPhone2G {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPhone1,1"];
}

+ (BOOL) isiPhone3G {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPhone1,2"];
}

+ (BOOL) isiPhone3GS {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPhone2,1"];
}

+ (BOOL) isiPhone4 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPhone3,1"] || [nsPlatform hasPrefix:@"iPhone3,2"] || [nsPlatform hasPrefix:@"iPhone3,3"]);
}

+ (BOOL) isiPhone4S {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPhone4,1"];
}

+ (BOOL) isiPhone5 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPhone5,1"] || [nsPlatform hasPrefix:@"iPhone5,2"]);
}

+ (BOOL) isiPhone5S {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPhone6,1"] || [nsPlatform hasPrefix:@"iPhone6,2"]);
}

+ (BOOL) isiPhone5C {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPhone5,3"] || [nsPlatform hasPrefix:@"iPhone5,4"]);
}

+ (BOOL) isiPodTouch {
	NSString *nsModel = [UIDevice currentDevice].model;
	return [nsModel hasPrefix:@"iPod touch"];
}

+ (BOOL) isiPodTouch1 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPod1,1"];
}

+ (BOOL) isiPodTouch2 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPod2,1"];
}

+ (BOOL) isiPodTouch3 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPod3,1"];
}

+ (BOOL) isiPodTouch4 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPod4,1"];
}

+ (BOOL) isiPodTouch5 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return [nsPlatform hasPrefix:@"iPod5,1"];
}

+ (BOOL) isiPad {
	NSString *nsModel = [UIDevice currentDevice].model;
	return [nsModel hasPrefix:@"iPad"];
}

+ (BOOL) isiPad1 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPad1,1"] || [nsPlatform hasPrefix:@"iPad1,2"]);
}

+ (BOOL) isiPad2 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPad2,1"] || [nsPlatform hasPrefix:@"iPad2,2"] || [nsPlatform hasPrefix:@"iPad2,3"]);
}

+ (BOOL) isiPad3 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPad3,1"] || [nsPlatform hasPrefix:@"iPad3,2"] || [nsPlatform hasPrefix:@"iPad3,3"]);
}

+ (BOOL) isiPad4 {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPad3,4"] || [nsPlatform hasPrefix:@"iPad3,5"] || [nsPlatform hasPrefix:@"iPad3,6"]);
}

+ (BOOL) isiPadMini {
	NSString *nsPlatform = [UIDevice currentDevice].platform;
	return ([nsPlatform hasPrefix:@"iPad2,5"] || [nsPlatform hasPrefix:@"iPad2,6"] || [nsPlatform hasPrefix:@"iPad2,7"]);
}

double g_iOSVersion = 0;
double getiOSVersion() {
    if (g_iOSVersion < 0.1) {
        NSString *nsOsversion = [UIDevice currentDevice].systemVersion;
        g_iOSVersion = atof([nsOsversion UTF8String]);
    }
    return g_iOSVersion;
}

+ (BOOL) isiOS7_1plus
{
    if (getiOSVersion() > 7.09) {
		return YES;
	}
	
	return NO;
}

+ (BOOL) isiOS8plus {
	if (getiOSVersion() > 7.9) {
		return YES;
	}
	
	return NO;
}

+ (BOOL) isiOS7plus {
	if (getiOSVersion() > 6.9) {
		return YES;
	}
	
	return NO;
}

+ (BOOL) isiOS6_1plus {
	if (getiOSVersion() > 6.0) {
		return YES;
	}
	
	return NO;
}

+ (BOOL) isiOS6plus {
	if (getiOSVersion() > 5.9) {
		return YES;
	}
	
	return NO;
}

+ (BOOL) isiOS5_1plus {
	if (getiOSVersion() > 5.0) {
		return YES;
	}
	
	return NO;
}

+ (BOOL) isiOS5plus {
	if (getiOSVersion() > 4.9) {
		return YES;
	}
	
	return NO;
}

static BOOL g_is568hScreen = NO;
static BOOL g_hasDetectIs568hScreen = NO;
+ (BOOL) is568hScreen {
	if (g_hasDetectIs568hScreen == NO) {
		g_hasDetectIs568hScreen = YES;
        
		NSString *path = [[NSBundle mainBundle] pathForResource:@"Default-568h@2x" ofType:@"png"];
		NSFileManager* fileMgr = [NSFileManager defaultManager];
		if (![fileMgr fileExistsAtPath:path]) {
			g_is568hScreen = NO;
		}
		int height = [UIScreen mainScreen].bounds.size.height;
		g_is568hScreen = (height == 568);
	}
	return g_is568hScreen;
}

//added by lgg 适配iphone6/6+ 屏幕
+ (BOOL) is320wScreen{
    int width = [UIScreen mainScreen].bounds.size.width;
    return (width == 320);
}

+ (BOOL) is480hScreen{  //iphone 4/4s/3g
    int height = [UIScreen mainScreen].bounds.size.height;
    return (height == 480);
}

//iphone 6 375*667
+ (BOOL) is375wScreen{
    int width = [UIScreen mainScreen].bounds.size.width;
    return (width == 375);
}
+ (BOOL) is667hScreen{
    int height = [UIScreen mainScreen].bounds.size.height;
    return (height == 667);
}

//iphone 6+ 414*736
+ (BOOL) is414wScreen{
    int width = [UIScreen mainScreen].bounds.size.width;
    return (width == 414);
}
+ (BOOL) is736hScreen{
    int height = [UIScreen mainScreen].bounds.size.height;
    return (height == 736);
}



@end
