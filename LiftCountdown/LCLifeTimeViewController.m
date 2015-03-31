//
//  LCLifeTimeViewController.m
//  LiftCountdown
//
//  Created by luo plus on 14-7-5.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCLifeTimeViewController.h"
#import "LCAppDelegate.h"
#import "LCDefine.h"

@interface LCLifeTimeViewController ()

@end

@implementation LCLifeTimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"生命倒计时";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(setting)];
	self.navigationItem.hidesBackButton = YES;
	
	self.tipsLabel = [[UILabel alloc] init];
	CGRect rect = self.view.frame;
	rect.origin.y = 100;
	rect.size.height = 40;
	self.tipsLabel.frame = rect;
	LCAppDelegate* appDelegate = (LCAppDelegate*)[UIApplication sharedApplication].delegate;
	NSString* tips = @"您的生命还剩下";
	self.tipsLabel.text = tips;
	self.tipsLabel.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:self.tipsLabel];
	
	self.timeLabel = [[UILabel alloc] init];
	rect.origin.y = 140;
	rect.size.height = 100;
	self.timeLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:40.0];
	self.timeLabel.frame = rect;
	NSTimeInterval remainInterval = appDelegate.mEndTimeInterval - [[NSDate date] timeIntervalSince1970];
	NSString* timeTips = [NSString stringWithFormat:@"%.1f秒", remainInterval];
	self.timeLabel.text = timeTips;
	self.timeLabel.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:self.timeLabel];
	
	self.mTimer = [NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
	
	if (self.mSoundPlayer == nil) {
		self.mSoundPlayer = [[LCSoundPlayer alloc] init];
		[self.mSoundPlayer startPlay];
	}
}

- (void)onTimer
{
	LCAppDelegate* appDelegate = (LCAppDelegate*)[UIApplication sharedApplication].delegate;
	NSTimeInterval remainInterval = appDelegate.mEndTimeInterval - [[NSDate date] timeIntervalSince1970];
	NSString* timeTips = [NSString stringWithFormat:@"%.1f秒", remainInterval];
	if (NSOrderedSame != [timeTips compare:self.timeLabel.text]) {
		self.timeLabel.text = timeTips;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setting
{
	UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:@"重置" otherButtonTitles:@"关于", nil];
	[actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex) {
		case 0:
			[self reset];
			break;
		case 1:
			break;
		default:
			break;
	}
}

- (void)reset
{
	[self.mTimer invalidate];
	
	[self.navigationController popToRootViewControllerAnimated:YES];
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:APP_STATE_KEY];
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:ENDTIME_KEY];
}

- (void)dealloc
{
	if (self.mSoundPlayer) {
		[self.mSoundPlayer stopPlay];
	}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
