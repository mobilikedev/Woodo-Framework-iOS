//
//  WEViewController.m
//  WoodoTest
//
//  Created by Gokhan Baris Aker on 18/02/14.
//  Copyright (c) 2014 Mobilike. All rights reserved.
//

#import <Woodo/WPWoodoViewController.h>
#import <Woodo/WPDefaultVideoControllerView.h>
#import <Woodo/WPWoodoView.h>

#import "WEViewController.h"
#import "ControllerView.h"

@interface WEViewController ()

@property (nonatomic, readwrite, weak) WPWoodoViewController *woodoViewController;
@property (nonatomic, readwrite, weak) WPWoodoView *woodoView;

@end

@implementation WEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(play:)];
    singleTap.numberOfTapsRequired = 1;
    [self.videoThumbnail addGestureRecognizer:singleTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) play:(id) sender
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        WPWoodoViewController *woodoViewController = [WPWoodoViewController new];
        
        woodoViewController.url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
        
        __weak WEViewController *selfWeak = self;
        
        woodoViewController.progressUpdateHandler = ^(CGFloat currentTime, CGFloat duration){
            
            WEViewController *selfStrong = selfWeak;
            
            if (selfStrong && selfStrong.controllerView)
            {
                CGFloat progress = currentTime / duration;
                
                [selfStrong.controllerView.seekSlider setValue:progress animated:YES];
            }
        };
        
        NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"ControllerView" owner:self options:nil];
        ControllerView *controllerView = (ControllerView *)[nibViews objectAtIndex:0];
        
        woodoViewController.attachmentView = controllerView;
        
        woodoViewController.attachmentView = [WPDefaultVideoControllerView new];
        
        self.woodoViewController = woodoViewController;
        
        [self presentViewController:woodoViewController
                           animated:YES
                         completion:nil];
    }
    else
    {
        NSURL *url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
        //        NSURL *url = [NSURL URLWithString:@"http://techslides.com/demos/sample-videos/small.mp4"];
        //        NSURL *url = [NSURL URLWithString:@"http://cdn.liverail.com/adasset4/20213/43908/127519/lo.mp4"];
        
        if(!self.woodoView)
        {
            WPWoodoView *woodoView = [[WPWoodoView alloc] initWithFrame:CGRectZero];
            [self.view addSubview:woodoView];
            self.woodoView = woodoView;
            
            NSDictionary *views = NSDictionaryOfVariableBindings(woodoView);
            
            NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[woodoView]-|" options:0 metrics:nil views:views];
            
            NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[woodoView]-|" options:0 metrics:nil views:views];
            
            [self.view addConstraints:horizontalConstraints];
            [self.view addConstraints:verticalConstraints];
        }
        
        self.woodoView.backgroundColor = [UIColor blackColor];
        
        [self.woodoView play:url
              withAttachment:[[WPDefaultVideoControllerView alloc] initWithFrame:CGRectZero]
      withAdvertisementToken:@"leToken"];
    }
}

- (IBAction)togglePlay:(id)sender
{
    WPWoodoViewController *woodoViewController = self.woodoViewController;
    
    if (woodoViewController)
    {
        if ([woodoViewController isPlaying])
        {
            [woodoViewController pause];
        }
        else
        {
            [woodoViewController resume];
        }
    }
    
    WPWoodoView *woodoView = self.woodoView;
    
    if (woodoView)
    {
        if([woodoView isPlaying])
        {
            [woodoView pause];
        }
        else
        {
            [woodoView resume];
        }
    }
}

- (IBAction)seek:(UISlider *)sender
{
    WPWoodoViewController *woodoViewController = self.woodoViewController;
    
    if (woodoViewController)
    {
        CGFloat percentage = (sender.value / sender.maximumValue);
        
        [woodoViewController seekTo:percentage];
    }
    
    WPWoodoView *woodoView = self.woodoView;
    
    if (woodoView)
    {
        CGFloat percentage = (sender.value / sender.maximumValue);
        
        [woodoView seekTo:percentage];
    }
}

@end
