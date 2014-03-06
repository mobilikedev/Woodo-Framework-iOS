//
//  WSViewController.m
//  Sample
//
//  Created by Gokhan Baris Aker on 21/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Woodo/WPManager.h>
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
    NSURL *url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    NSString *token = @"TESTPLAYER";
    UIView *attachmentView = [[WPDefaultVideoControllerView alloc] init];
    
    void(^presentationHandler)() = ^(){
        
        NSLog(@"Presented (Available on UI)");
    };
    
    void(^startHandler)() = ^(){
        
        NSLog(@"Started");
    };
    
    void(^progressHandler)(CGFloat currentTime, CGFloat duration) = ^(CGFloat currentTime, CGFloat duration){
        
        // Video progress updated
        NSLog(@"%f / %f", currentTime, duration);
    };
    
    void(^finishHandler)() = ^(){
        
        // Handle finish here
        NSLog(@"Finished");
    };
    
    void(^errorHandler)() = ^(){
        
        // Handle error here
        NSLog(@"Error");
    };
    
    [[WPManager sharedManager]
     presentWoodoWithUrl:url
     token:token
     attachmentView:attachmentView
     shareText:nil
     shareTitle:nil
     shareRecipients:nil
     presentationHandler:presentationHandler
     startHandler:startHandler
     progressHandler:progressHandler
     finishHandler:finishHandler
     errorHandler:errorHandler];
}

@end
