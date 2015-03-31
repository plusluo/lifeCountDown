//
//  LCSoundPlay.h
//  LiftCountdown
//
//  Created by luo plus on 14-8-16.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface LCSoundPlayer : NSObject<AVAudioPlayerDelegate>
{
	SystemSoundID mShortSound;
    AVAudioPlayer* mAudioPlayer;
}

- (void)startPlay;
- (void)stopPlay;
@end
