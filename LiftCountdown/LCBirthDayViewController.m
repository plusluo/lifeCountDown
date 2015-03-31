//
//  LCSettingViewController.m
//  LiftCountdown
//
//  Created by luo plus on 14-7-3.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCBirthDayViewController.h"
#import "LCAppDelegate.h"
#import "LCAgeViewController.h"

@interface LCBirthDayViewController ()

@end

@implementation LCBirthDayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"选择你的出生日期";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(clickNextStep)];
	
	CGRect rect = self.view.frame;
	

	NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:1982];
    [adcomps setMonth:9];
    [adcomps setDay:7];
    NSDate* setDate = [calendar dateFromComponents:adcomps];
	
	rect.origin.y = 40;
	rect.size.height = 20;
	UILabel* titleLabel = [[UILabel alloc] initWithFrame:rect];
	titleLabel.text = @"      请选择您的出生日期:";
	[self.view addSubview:titleLabel];
	
	self.mDataPicker = [[UIDatePicker alloc] init];
	rect.origin.y = 60;
	rect.size.height = 200;
	self.mDataPicker.frame = rect;
	self.mDataPicker.date = setDate;
	self.mDataPicker.datePickerMode = UIDatePickerModeDate;
	
	[self.mDataPicker addTarget:self action:@selector(birthDayChange:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:self.mDataPicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)birthDayChange:(id)sender
{
	[self birthDayUpdate];
}

- (void)birthDayUpdate
{
	LCAppDelegate* delegate = [UIApplication sharedApplication].delegate;
	delegate.mBirthDay = self.mDataPicker.date;

}

- (void)clickNextStep
{
	[self birthDayUpdate];
	LCAgeViewController* ageViewController = [[LCAgeViewController alloc] init];
	[self.navigationController pushViewController:ageViewController animated:YES];
//	LCAppDelegate* delegate = [UIApplication sharedApplication].delegate;
//	[delegate enterAgeView];
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
