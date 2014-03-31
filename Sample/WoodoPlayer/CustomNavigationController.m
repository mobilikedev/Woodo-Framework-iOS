//
//  CustomNavigationController.m
//  WoodoPlayer
//
//  Created by Erkan CAN on 11.03.2014.
//  Copyright (c) 2014 Erkan CAN. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

#define iPad [UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad

#pragma mark - Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.349 green:0.353 blue:0.361 alpha:1]];
    [self.navigationBar setTranslucent:NO];
    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LandScape Delegate Method

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown && iPad) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)shouldAutorotate
{
    
    if(iPad){
        return YES;
    }
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    
    if(iPad){
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if(iPad){
        return [super preferredInterfaceOrientationForPresentation];
    }
    return UIInterfaceOrientationPortrait;
}

@end
