//
//  WPWoodoView.h
//  WoodoPlayerTempProject
//
//  Created by Gokhan Baris Aker on 09/12/13.
//  Copyright (c) 2013 Woodo. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>

@interface WPWoodoView : UIView <CLLocationManagerDelegate>

@property (atomic, readwrite) NSError *error;

@property (nonatomic, readwrite, copy) NSArray *shareRecipients;    // Mail only
@property (nonatomic, readwrite, copy) NSString *shareTitle;    // Mail only
@property (nonatomic, readwrite, copy) NSString *shareText;
//@property (nonatomic, readwrite, copy) NSArray *shareUrls;
//@property (nonatomic, readwrite, copy) NSArray *shareImages;
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


- (void) play:(NSURL *) url
withAttachment:(UIView *) attachmentView
withAdvertisementToken:(NSString *) token;
- (void) pause;
- (void) resume;
- (void) seekTo:(CGFloat) percentage;

- (void) toggleFullscreen;

@end
