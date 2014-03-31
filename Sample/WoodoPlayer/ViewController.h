//
//  ViewController.h
//  WoodoPlayer
//
//  Created by Erkan CAN on 11.03.2014.
//  Copyright (c) 2014 Erkan CAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
- (IBAction)resume:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)randomSeek:(id)sender;
- (IBAction)randomVolume:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)load:(id)sender;
- (IBAction)terminate:(id)sender;

@end
