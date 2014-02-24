//
//  WSCustomVideoControllerView.m
//  Sample
//
//  Created by Gokhan Baris Aker on 24/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import "WSCustomVideoControllerView.h"

static NSTimeInterval const FadeOutTimeInterval = 4.0;

@interface WSCustomVideoControllerView ()

@property (nonatomic, readwrite) NSDate *lastFadeOutScheduleDate;

@end

@implementation WSCustomVideoControllerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)didMoveToSuperview
{
    [self scheduleFadeOut];
}

- (void)tap:(id)sender
{
    __weak WSCustomVideoControllerView *selfWeak = self;
    
    dispatch_async(dispatch_get_main_queue(), ^(){
    
        WSCustomVideoControllerView *selfStrong = selfWeak;
        
        if (selfStrong)
        {
            if (selfStrong.footerView.hidden)
            {
                selfStrong.footerView.hidden = NO;
                selfStrong.headerView.hidden = NO;
                
                [selfStrong scheduleFadeOut];
            }
            else
            {
                selfStrong.footerView.hidden = YES;
                selfStrong.headerView.hidden = YES;
            }
        }
    });
}

- (void) scheduleFadeOut
{
    self.lastFadeOutScheduleDate = [NSDate date];
    
    __weak WSCustomVideoControllerView *selfWeak = self;
    
    double delayInSeconds = FadeOutTimeInterval;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        WSCustomVideoControllerView *selfStrong = selfWeak;
        
        if (selfStrong)
        {
            NSTimeInterval elapsedTimeInterval = [[NSDate date] timeIntervalSinceDate:selfStrong.lastFadeOutScheduleDate];
            
            if (elapsedTimeInterval >= FadeOutTimeInterval)
            {
                selfStrong.footerView.hidden = YES;
                selfStrong.headerView.hidden = YES;
            }
        }
    });
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // Touch event occured
    // Reset scheduled timeout
    [self scheduleFadeOut];
    
    return [super hitTest:point withEvent:event];
}

@end
