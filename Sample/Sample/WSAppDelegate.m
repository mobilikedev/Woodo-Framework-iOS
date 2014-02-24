//
//  WSAppDelegate.m
//  Sample
//
//  Created by Gokhan Baris Aker on 21/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Woodo/WPWoodoView.h>

#import "WSAppDelegate.h"

@implementation WSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
//    [WPWoodoView setAccessToken:@"<Please contact team@woodo.tv for access token data>"];
//    [WPWoodoView setAppToken:@"<Please contact team@woodo.tv for app token data>"];
//    [WPWoodoView setClientSecret:@"<Please contact team@woodo.tv for client secret data>"];
    
    NSString *accessToken = @"a134cfc19e076bf3f639748964954b1faeb48990";
    NSString *appToken = @"app:4c39e25c-77d6-411d-9ecd-13a768765dfa";
    NSString *secret = @"03043a38b37bc9beff427a6dedfcf210b1625019";
    
    [WPWoodoView setAccessToken:accessToken];
    [WPWoodoView setAppToken:appToken];
    [WPWoodoView setClientSecret:secret];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
