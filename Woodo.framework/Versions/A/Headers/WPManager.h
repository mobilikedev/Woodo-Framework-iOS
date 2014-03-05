//
//  WPManager.h
//  Woodo Project iOS
//
//  Created by Gokhan Baris Aker on 05/03/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <CoreGraphics/CGBase.h>

@interface WPManager : NSObject

// Singleton instance provider
+ (instancetype)sharedManager;

// Woodo credential accessors
+ (NSString *) appToken;
+ (void) setAppToken:(NSString *) token;
+ (NSString *) accessToken;
+ (void) setAccessToken:(NSString *) token;
+ (NSString *) clientSecret;
+ (void) setClientSecret:(NSString *) secret;

// Woodo view controller presenter
- (void) presentWoodoWithUrl:(NSURL *) url
                       token:(NSString *) token
              attachmentView:(UIView *) attachmentView
                   shareText:(NSString *) shareText
                  shareTitle:(NSString *) shareTitle
             shareRecipients:(NSArray *) shareRecipients
         presentationHandler:(dispatch_block_t) presentationHandler
                startHandler:(dispatch_block_t) startHandler
             progressHandler:(void(^)(CGFloat currentTime, CGFloat duration)) progressHandler
               finishHandler:(dispatch_block_t) finishHandler
                errorHandler:(dispatch_block_t) errorHandler;

- (void) addWoodoToView:(UIView *) view
                    url:(NSURL *) url
                  token:(NSString *) token
         attachmentView:(UIView *) attachmentView
              shareText:(NSString *) shareText
             shareTitle:(NSString *) shareTitle
        shareRecipients:(NSArray *) shareRecipients
    presentationHandler:(dispatch_block_t) presentationHandler
           startHandler:(dispatch_block_t) startHandler
        progressHandler:(void(^)(CGFloat currentTime, CGFloat duration)) progressHandler
          finishHandler:(dispatch_block_t) finishHandler
           errorHandler:(dispatch_block_t) errorHandler;

@end
