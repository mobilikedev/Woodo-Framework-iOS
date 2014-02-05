//
//  WPWoodoView.h
//  WoodoPlayerTempProject
//
//  Created by Gokhan Baris Aker on 09/12/13.
//  Copyright (c) 2013 Woodo. All rights reserved.
//

@interface WPWoodoView : UIView

#define WoodoPlayerPerformedFinishNotification @"videoplayer.performed.finish"
#define WoodoPlayerErrorNotification @"videoplayer.error"

- (void) play:(NSURL *) url
withAttachment:(UIView *) attachmentView
withAdvertisementToken:(NSString *) token;
- (void) pause:(void(^)(BOOL succeed)) resultHandler;
- (void) resume:(void(^)(BOOL succeed)) resultHandler;
- (void) seekTo:(CGFloat) percentage resultHandler:(void(^)(BOOL succeed)) resultHandler;

@end
