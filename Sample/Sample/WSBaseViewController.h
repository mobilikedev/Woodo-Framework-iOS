//
//  WSBaseViewController.h
//  Sample
//
//  Created by Gokhan Baris Aker on 24/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WPWoodoView;
@class WPWoodoViewController;
@class WSCustomVideoControllerView;

@interface WSBaseViewController : UIViewController

@property (nonatomic, readwrite, weak) WPWoodoView *woodoView;
@property (nonatomic, readwrite, weak) WPWoodoViewController *woodoViewController;
@property (nonatomic, readwrite, weak) WSCustomVideoControllerView *customVideoControllerView;

//- (UIView *) createVideoControllerView;
//- (IBAction) togglePlay:(id)sender;
//- (IBAction) seek:(UISlider *)sender;
//- (NSString *) formatTime:(CGFloat) timeInSeconds;

@end
