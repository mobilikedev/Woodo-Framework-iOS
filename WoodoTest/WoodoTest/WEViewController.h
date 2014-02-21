//
//  WEViewController.h
//  WoodoTest
//
//  Created by Gokhan Baris Aker on 18/02/14.
//  Copyright (c) 2014 Mobilike. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ControllerView;

@interface WEViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnail;
@property (weak, nonatomic) IBOutlet ControllerView *controllerView;

- (IBAction)togglePlay:(id)sender;
- (IBAction)seek:(id)sender;

@end
