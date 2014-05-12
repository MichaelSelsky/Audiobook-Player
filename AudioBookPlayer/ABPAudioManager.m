//
//  ABPAudioManager.m
//  AudioBookPlayer
//
//  Created by MichaelSelsky on 5/12/14.
//  Copyright (c) 2014 MichaelSelsky. All rights reserved.
//

#import "ABPAudioManager.h"
@import MediaPlayer;

@interface ABPAudioManager ()

@property BOOL needsToLoadAudiobooks;

@end


@implementation ABPAudioManager

@synthesize audiobooks = _audiobooks;

+ (ABPAudioManager *)sharedManger{
    static ABPAudioManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ABPAudioManager alloc] init];
    });
    return sharedManager;
}

- (NSArray *)audiobooks{
    if (!_audiobooks){
        if (self.needsToLoadAudiobooks){
            self.needsToLoadAudiobooks = NO;
            [self loadAudiobooks];
        }
        return nil;
    }
    return _audiobooks;
}

- (void)loadAudiobooks{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        MPMediaQuery *query = [MPMediaQuery audiobooksQuery];
        _audiobooks = [query items];
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:ABPLoadedNotification object:nil];
        });
    });
}

@end
