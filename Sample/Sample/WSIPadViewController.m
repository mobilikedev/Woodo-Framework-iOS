//
//  WSIPadViewController.m
//  Sample
//
//  Created by Gokhan Baris Aker on 24/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Woodo/WPManager.h>
#import <Woodo/WPDefaultVideoControllerView.h>

#import "WSIPadViewController.h"

@interface WSIPadViewController ()

@property (nonatomic, readwrite, weak) WPWoodoView *woodoView;

@end

@implementation WSIPadViewController

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
     addWoodoToView:self.videoThumbnail
     url:url
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
