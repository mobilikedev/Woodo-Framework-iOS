//
//  AppDelegate.m
//  WoodoPlayer
//
//  Created by Erkan CAN on 11.03.2014.
//  Copyright (c) 2014 Erkan CAN. All rights reserved.
//

#import "AppDelegate.h"

#import <Woodo/WPManager.h>

@implementation AppDelegate

#define appToken @"app:37717a20-3714-4fc4-87ea-e81365660883"
#define accessToken @"e11146ecc1fc013fd20238fd43866ac17143e3bb"
#define clinetSecret @"d273d15613e38f4795292bd04b786e5055ebfb46"

- (void)wodooSettings
{
    
    [WPManager setAccessToken:accessToken];
    [WPManager setAppToken:appToken];
    [WPManager setClientSecret:clinetSecret];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self wodooSettings];
 
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
