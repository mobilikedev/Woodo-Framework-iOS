//
//  WSBaseViewController.m
//  Sample
//
//  Created by Gokhan Baris Aker on 24/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import "WSBaseViewController.h"
#import "WSCustomVideoControllerView.h"

@interface WSBaseViewController ()

@property (nonatomic, readwrite) BOOL videoPlayerShouldResume;

@end

@implementation WSBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (UIView *) createVideoControllerView
//{
//    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"WSCustomVideoControllerView" owner:self options:nil];
//    WSCustomVideoControllerView *controllerView = (WSCustomVideoControllerView *)[nibViews objectAtIndex:0];
//    
//    [controllerView.playToggleButton addTarget:self
//                                        action:@selector(togglePlay:)
//                              forControlEvents:UIControlEventTouchUpInside];
//    
//    [controllerView.progressSlider addTarget:self
//                                      action:@selector(seek:)
//                            forControlEvents:UIControlEventValueChanged];
//    
//    [controllerView.progressSlider addTarget:self
//                                      action:@selector(seekDidStart:)
//                            forControlEvents:UIControlEventTouchDown];
//    
//    [controllerView.progressSlider addTarget:self
//                                      action:@selector(seekDidEnd:)
//                            forControlEvents:UIControlEventTouchUpInside];
//    
//    self.customVideoControllerView = controllerView;
//    
//    return controllerView;
//}
//
//- (IBAction)togglePlay:(id)sender
//{
//    NSString *title = nil;
//    
//    WPWoodoViewController *woodoViewController = self.woodoViewController;
//    
//    if (woodoViewController)
//    {
//        if ([woodoViewController isPlaying])
//        {
//            [woodoViewController pause];
//            title = @"Play";
//        }
//        else
//        {
//            [woodoViewController resume];
//            title = @"Pause";
//        }
//    }
//    
//    WPWoodoView *woodoView = self.woodoView;
//    
//    if (woodoView)
//    {
//        if([woodoView isPlaying])
//        {
//            [woodoView pause];
//            title = @"Play";
//        }
//        else
//        {
//            [woodoView resume];
//            title = @"Pause";
//        }
//    }
//    
//    __weak WSBaseViewController *selfWeak = self;
//    
//    dispatch_async(dispatch_get_main_queue(), ^(){
//    
//        WSBaseViewController *selfStrong = selfWeak;
//        
//        if (selfStrong)
//        {
//            [selfStrong.customVideoControllerView.playToggleButton setTitle:title
//                                                                   forState:UIControlStateNormal];
//        }
//    });
//}
//
//- (IBAction)seek:(UISlider *)sender
//{
//    WPWoodoViewController *woodoViewController = self.woodoViewController;
//    
//    if (woodoViewController)
//    {
//        CGFloat percentage = (sender.value / sender.maximumValue);
//        
//        [woodoViewController seekTo:percentage];
//    }
//    
//    WPWoodoView *woodoView = self.woodoView;
//    
//    if (woodoView)
//    {
//        CGFloat percentage = (sender.value / sender.maximumValue);
//        
//        [woodoView seekTo:percentage];
//    }
//}
//
//- (IBAction)seekDidStart:(id)sender
//{
//    WPWoodoViewController *woodoViewController = self.woodoViewController;
//    
//    if (woodoViewController)
//    {
//        if ([woodoViewController isPlaying])
//        {
//            self.videoPlayerShouldResume = YES;
//        }
//        
//        [woodoViewController pause];
//    }
//    
//    WPWoodoView *woodoView = self.woodoView;
//    
//    if (woodoView)
//    {
//        if ([woodoView isPlaying])
//        {
//            self.videoPlayerShouldResume = YES;
//        }
//        
//        [woodoView pause];
//    }
//}
//
//- (IBAction)seekDidEnd:(id)sender
//{
//    WPWoodoViewController *woodoViewController = self.woodoViewController;
//    
//    if (woodoViewController && self.videoPlayerShouldResume)
//    {
//        [woodoViewController resume];
//    }
//    
//    WPWoodoView *woodoView = self.woodoView;
//    
//    if (woodoView && self.videoPlayerShouldResume)
//    {
//        [woodoView resume];
//    }
//}
//
//- (NSString *) formatTime:(CGFloat) timeInSeconds
//{
//    NSUInteger seconds = (NSUInteger)round(timeInSeconds);
//    NSString *string = [NSString stringWithFormat:@"%02u:%02u",
//                        (seconds / 60) % 60, seconds % 60];
//    
//    return string;
//}

@end
