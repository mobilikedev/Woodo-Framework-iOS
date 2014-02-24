//
//  WSIPadViewController.m
//  Sample
//
//  Created by Gokhan Baris Aker on 24/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Woodo/WPWoodoView.h>
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
    // If woodo view not initialized before
    if(!self.woodoView)
    {
        // Allocate & initialized new instance
        WPWoodoView *woodoView = [[WPWoodoView alloc] initWithFrame:CGRectZero];
        
        // Attach woodo view into its container
        [self.videoThumbnail addSubview:woodoView];
        self.woodoView = woodoView;
        
        // Define metrics via auto layout constraints
        [woodoView setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSDictionary *views = NSDictionaryOfVariableBindings(woodoView);
        
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[woodoView]-|" options:0 metrics:nil views:views];
        
        NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[woodoView]-|" options:0 metrics:nil views:views];
        
        [self.videoThumbnail addConstraints:horizontalConstraints];
        [self.videoThumbnail addConstraints:verticalConstraints];
        
        // Set background
        [self.woodoView setBackgroundColor:[UIColor blackColor]];
    }
    
    [self.woodoView play:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]
          withAttachment:[[WPDefaultVideoControllerView alloc] init]
  withAdvertisementToken:@"<Please contact team@woodo.tv for token data>"];
}

@end
