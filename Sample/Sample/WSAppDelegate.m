//
//  WSAppDelegate.m
//  Sample
//
//  Created by Gokhan Baris Aker on 21/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Woodo/WPManager.h>

#import "WSAppDelegate.h"

@implementation WSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
//    [WPManager setAccessToken:@"<Please contact team@woodo.tv for access token data>"];
//    [WPManager setAppToken:@"<Please contact team@woodo.tv for app token data>"];
//    [WPManager setClientSecret:@"<Please contact team@woodo.tv for client secret data>"];
    
    NSString *accessToken = @"a134cfc19e076bf3f639748964954b1faeb48990";
    NSString *appToken = @"app:4c39e25c-77d6-411d-9ecd-13a768765dfa";
    NSString *secret = @"03043a38b37bc9beff427a6dedfcf210b1625019";
    
    [WPManager setAccessToken:accessToken];
    [WPManager setAppToken:appToken];
    [WPManager setClientSecret:secret];
    
    return YES;
}

@end
