//
//  WPRemoteControl.h
//  Woodo Project iOS
//
//  Created by Gokhan Baris Aker on 07/03/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface WPRemoteControl : NSObject

// TODO: Add play
- (void) pause;
- (void) resume;
- (void) seekTo:(CGFloat) percentage;
- (void) setVolume:(CGFloat) percentage;

- (void) toggleFullscreen;
- (void) saveState;
- (void) loadState;
- (void) close;

@end