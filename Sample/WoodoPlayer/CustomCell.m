//
//  CustomCell.m
//  WoodoPlayer
//
//  Created by Erkan CAN on 11.03.2014.
//  Copyright (c) 2014 Erkan CAN. All rights reserved.
//

#import "CustomCell.h"

#define iPad [UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.cellTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 0.0, 260.0, 60.0)];
        
        [self.cellTitleLabel setTextColor:[UIColor colorWithRed:0.349 green:0.353 blue:0.361 alpha:1]];
        
        [self.cellTitleLabel setBackgroundColor:[UIColor clearColor]];
        
        [self.cellTitleLabel setFont:[UIFont fontWithName:@"OpenSans" size:24.0]];
        
        self.backgroundColor = [UIColor clearColor];

        [self.contentView addSubview:self.cellTitleLabel];
        
        if (iPad) {
            
            self.cellImageView = [[UIView alloc] initWithFrame:CGRectMake(270.0, 20.0, 20.0, 20.0)];
            
            [self.cellImageView setBackgroundColor:[UIColor colorWithRed:0.349 green:0.353 blue:0.361 alpha:1]];
            
            [self.cellImageView.layer setMasksToBounds:YES];
            
            [self.cellImageView.layer setCornerRadius:10.0];
            
            [self.contentView addSubview:self.cellImageView];
            
        }
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    if (iPad && selected == YES) {
    
       [ self.cellImageView setBackgroundColor:[UIColor colorWithRed:0.980 green:0.545 blue:0.247 alpha:1]];
        
    }

    // Configure the view for the selected state
}

@end
