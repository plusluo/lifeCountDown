//
//  LCAgeViewController.h
//  LiftCountdown
//
//  Created by luo plus on 14-7-16.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCViewController.h"

@interface LCAgeViewController : LCViewController

@property (strong, nonatomic) UISegmentedControl *mSegmentedControl;
@property (strong, nonatomic) UILabel *mTipsLabel;
@property (strong, nonatomic) UILabel *mAgeLabel;
@property (assign, nonatomic) int mIndex;

@end
