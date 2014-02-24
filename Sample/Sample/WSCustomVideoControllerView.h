//
//  WSCustomVideoControllerView.h
//  Sample
//
//  Created by Gokhan Baris Aker on 24/02/14.
//  Copyright (c) 2014 Woodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPVolumeView.h>

@interface WSCustomVideoControllerView : UIView

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIButton *playToggleButton;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet MPVolumeView *volumeView;

- (IBAction)tap:(id)sender;

@end
