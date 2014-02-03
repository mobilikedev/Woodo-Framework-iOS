//
//  WPWoodoView.h
//  WoodoPlayerTempProject
//
//  Created by Gokhan Baris Aker on 09/12/13.
//  Copyright (c) 2013 Woodo. All rights reserved.
//

@interface WPWoodoView : UIImageView <UIGestureRecognizerDelegate>

@property (nonatomic, readwrite) NSURL *contentUrl;

- (void) play;

@end
