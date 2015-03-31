//
//  LCViewController.m
//  LiftCountdown
//
//  Created by luo plus on 14-7-5.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCViewController.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
