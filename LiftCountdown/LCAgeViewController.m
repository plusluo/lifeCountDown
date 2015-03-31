//
//  LCAgeViewController.m
//  LiftCountdown
//
//  Created by luo plus on 14-7-16.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCAgeViewController.h"
#import "LCAppDelegate.h"
#import "LCLifeTimeViewController.h"

const int AGE_NUM[5] = {65, 70, 80, 90, 99};

@interface LCAgeViewController ()

@end

@implementation LCAgeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"请选择你的健康状况";
		self.mIndex = 2;
    }
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(clickDone)];
	
	///////////////////
	NSArray* segmentedItems = [[NSArray alloc] initWithObjects:@"很差",@"亚健康",@"正常",@"健康",@"非常好", nil];
	self.mSegmentedControl = [[UISegmentedControl alloc] initWithItems:segmentedItems];
	self.mSegmentedControl.selectedSegmentIndex = self.mIndex;
	const int nWidth = self.view.frame.size.width - 20;
	const int nHeight = 30;
	self.mSegmentedControl.frame = CGRectMake((self.view.frame.size.width-nWidth)/2, 80, nWidth, nHeight);

	[self.view addSubview:self.mSegmentedControl];

	[self.mSegmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	///////////////////////
	CGRect labelFrame = self.mSegmentedControl.frame;
	labelFrame.origin.y = 120;
	labelFrame.size.height = 60;
	self.mTipsLabel = [[UILabel alloc] initWithFrame:labelFrame];
	[self.mTipsLabel setTextColor:[UIColor darkGrayColor]];
	[self.view addSubview:self.mTipsLabel];
	[self.mTipsLabel setLineBreakMode:NSLineBreakByWordWrapping];
	self.mTipsLabel.textAlignment = NSTextAlignmentCenter;
	self.mTipsLabel.numberOfLines = 2;
	self.mTipsLabel.text = @"我的健康状况一般";
	
	labelFrame.origin.y = 200;
	UILabel* tipsLabel2 = [[UILabel alloc] initWithFrame:labelFrame];
	[self.view addSubview:tipsLabel2];
	tipsLabel2.textAlignment = NSTextAlignmentCenter;
	tipsLabel2.text = @"你的预期寿命是";
	
	labelFrame.origin.y = 240;
	labelFrame.size.height = 100;
	self.mAgeLabel = [[UILabel alloc] initWithFrame:labelFrame];
	[self.mAgeLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:60.0]];
	[self.view addSubview:self.mAgeLabel];
	self.mAgeLabel.textAlignment = NSTextAlignmentCenter;
	self.mAgeLabel.text = @"80年";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (int)getMaxAge
{
	if (self.mIndex < 0 || self.mIndex > sizeof(AGE_NUM)-1) {
		return 80;
	}
	return AGE_NUM[self.mIndex];
}

- (NSString*)getAgeTips
{
	NSString* tips = @"";
	switch (self.mIndex) {
		case 0:
			tips = @"我经常生病 而且也吸烟喝酒 体重不太正常";
			break;
		case 1:
			tips = @"我很少运动，体重不达标，比较容易生病";
			break;
		case 2:
			tips = @"不吸烟 只是偶尔喝酒 不是经常生病 但也不是经常运动";
			break;
		case 3:
			tips = @"不吸烟 也很少喝酒 很少生病 比较爱运动";
			break;
		case 4:
			tips = @"我身体很强壮，已经很久没有生病了，而且经常保持运动和好的饮食习惯";
			break;
		default:
			break;
	}
	return tips;
}

- (void)segmentAction:(id)sender
{
	UISegmentedControl* seg = (UISegmentedControl*)sender;
	self.mIndex = seg.selectedSegmentIndex;
	
	if (self.mTipsLabel == nil || self.mAgeLabel == nil) {
		return;
	}
	NSString* ageTips = [NSString stringWithFormat:@"%d年", [self getMaxAge]];
	self.mAgeLabel.text = ageTips;
	self.mTipsLabel.text = [self getAgeTips];
}

- (void)clickDone
{
	LCAppDelegate* delegate = [UIApplication sharedApplication].delegate;
	
	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *comps = nil;
	comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:delegate.mBirthDay];
	NSDateComponents *adcomps = [[NSDateComponents alloc] init];
	[adcomps setYear:[self getMaxAge]];
	[adcomps setMonth:0];
	[adcomps setDay:0];
	NSDate* endDate = [calendar dateByAddingComponents:adcomps toDate:delegate.mBirthDay options:0];
	delegate.mEndTimeInterval = [endDate timeIntervalSince1970];

	LCLifeTimeViewController* lifeTimeViewController = [[LCLifeTimeViewController alloc] init];
	[self.navigationController pushViewController:lifeTimeViewController animated:YES];
	
	
	[[NSUserDefaults standardUserDefaults] setFloat:delegate.mEndTimeInterval forKey:ENDTIME_KEY];
	[[NSUserDefaults standardUserDefaults] setInteger:APP_STATE_ENTER forKey:APP_STATE_KEY];
	
}

- (void)dealloc
{
	NSLog(@"dealloc");
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
