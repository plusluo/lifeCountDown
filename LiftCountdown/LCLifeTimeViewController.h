//
//  LCLifeTimeViewController.h
//  LiftCountdown
//
//  Created by luo plus on 14-7-5.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCViewController.h"
#import "LCSoundPlayer.h"

@interface LCLifeTimeViewController : LCViewController<UIActionSheetDelegate>

@property (strong, nonatomic) UILabel *tipsLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) NSTimer *mTimer;
@property (strong, nonatomic) LCSoundPlayer *mSoundPlayer;

@end
