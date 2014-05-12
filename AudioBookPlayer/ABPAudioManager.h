//
//  ABPAudioManager.h
//  AudioBookPlayer
//
//  Created by MichaelSelsky on 5/12/14.
//  Copyright (c) 2014 MichaelSelsky. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const ABPLoadedNotification = @"ABPLoadedNotification";

@interface ABPAudioManager : NSObject
@property (strong, nonatomic) NSArray *audiobooks;
+ (ABPAudioManager *)sharedManger;
@end
