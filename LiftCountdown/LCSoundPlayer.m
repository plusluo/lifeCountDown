//
//  LCSoundPlay.m
//  LiftCountdown
//
//  Created by luo plus on 14-8-16.
//  Copyright (c) 2014年 plusluo. All rights reserved.
//

#import "LCSoundPlayer.h"

@implementation LCSoundPlayer

- (id)init
{
    self = [super init];
    if (self) {
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"seconds" ofType:@"mp3"];
        if (musicPath) {
            NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
            mAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
			mAudioPlayer.numberOfLoops = -1;
            [mAudioPlayer setDelegate:self];
        }
	}
	return self;
}

- (void)startPlay
{
	if (nil == mAudioPlayer) {
		return;
	}
    if (![mAudioPlayer isPlaying]) {
        [mAudioPlayer play];
    }
}

- (void)stopPlay
{
	if (nil == mAudioPlayer) {
		return;
	}
    if ([mAudioPlayer isPlaying]) {
        [mAudioPlayer stop];
    }
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
	if (nil == mAudioPlayer) {
		return;
	}
    [mAudioPlayer play];
}

//- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
//                       successfully:(BOOL)flag
//{
//    if (nil == mAudioPlayer) {
//		return;
//	}
//    [mAudioPlayer play];
//}

- (void)dealloc
{
	[self stopPlay];
}

@end
