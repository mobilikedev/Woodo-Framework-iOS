//
//  WPWoodoViewController.h
//  Woodo Project iOS
//
//  Created by Gokhan Baris Aker on 05/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPWoodoViewController : UIViewController

@property (nonatomic, readwrite) NSURL *url;
@property (nonatomic, readwrite) NSString *token;
@property (nonatomic, readwrite) UIView *attachmentView;

@property (nonatomic, readwrite, copy) NSString *shareText;
@property (nonatomic, readwrite, copy) NSString *shareTitle;
@property (nonatomic, readwrite, copy) NSArray *shareRecipients;

@property (nonatomic, readonly, getter = isPlaying) BOOL playing;

@property (nonatomic, readwrite, strong) void(^startHandler)();
@property (nonatomic, readwrite, strong) void(^progressUpdateHandler)(CGFloat currentTime, CGFloat duration);    // Works only with user content
@property (nonatomic, readwrite, strong) void(^finishHandler)();
@property (nonatomic, readwrite, strong) void(^errorHandler)();

+ (NSString *) appToken;
+ (void) setAppToken:(NSString *) appToken;
+ (NSString *) accessToken;
+ (void) setAccessToken:(NSString *) accessToken;
+ (NSString *) clientSecret;
+ (void) setClientSecret:(NSString *) clientSecret;

- (void) pause;
- (void) resume;
- (void) seekTo:(CGFloat) percentage;

@end
