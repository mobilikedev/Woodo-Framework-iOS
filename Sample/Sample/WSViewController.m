//
//  WSViewController.m
//  Sample
//
//  Created by Gokhan Baris Aker on 21/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Woodo/WPWoodoViewController.h>
#import <Woodo/WPDefaultVideoControllerView.h>

#import "WSViewController.h"
#import "WSCustomVideoControllerView.h"

@implementation WSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(play:)];
    singleTap.numberOfTapsRequired = 1;
    [self.videoThumbnail addGestureRecognizer:singleTap];
}

- (void) play:(id) sender
{
    // Allocate & initialize new instance
    WPWoodoViewController *woodoViewController = [[WPWoodoViewController alloc] init];
    
    // Setup
    // Advertisement token
    woodoViewController.token = @"<Please contact team@woodo.tv for token data>";
    // Video content url (The content url that you want to play)
    woodoViewController.url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
//    // Attach mint-fresh instance of default view controller
//    woodoViewController.attachmentView = [[WPDefaultVideoControllerView alloc] init];
    // Attach mint-fresh instance of custom view controller
    woodoViewController.attachmentView = [self createVideoControllerView];
    
    // Register for callbacks
    __weak WSViewController *selfWeak = self;
    
    woodoViewController.startHandler = ^(){
    
    };
    
    woodoViewController.progressUpdateHandler = ^(CGFloat currentTime, CGFloat duration){
    
        dispatch_async(dispatch_get_main_queue(), ^(){
        
            WSViewController *selfStrong = selfWeak;
            
            if (selfStrong)
            {
                CGFloat progress = currentTime / duration;
                
                [selfStrong.customVideoControllerView.progressSlider
                 setValue:progress
                 animated:YES];
                
                NSString *progressText = [NSString stringWithFormat:@"%@ / %@", [selfStrong formatTime:currentTime], [selfStrong formatTime:duration]];
                [selfStrong.customVideoControllerView.progressLabel setText:progressText];
            }
        });
    };
    
    woodoViewController.finishHandler = ^(){
    
        dispatch_async(dispatch_get_main_queue(), ^(){
            
            WSViewController *selfStrong = selfWeak;
            
            if (selfStrong)
            {
                [selfStrong dismissViewControllerAnimated:YES
                                               completion:nil];
            }
        });
    };
    
    self.woodoViewController = woodoViewController;
    
    [self presentViewController:self.woodoViewController
                       animated:YES
                     completion:nil];
}

@end
