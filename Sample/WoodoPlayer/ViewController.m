//
//  ViewController.m
//  WoodoPlayer
//
//  Created by Erkan CAN on 11.03.2014.
//  Copyright (c) 2014 Erkan CAN. All rights reserved.
//

#import "ViewController.h"

#import <Woodo/WPDefaultVideoControllerView.h>

#import <Woodo/WPManager.h>
#import <Woodo/WPRemoteControl.h>

#import "CustomCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray  * data;

@property (nonatomic, strong) NSArray  * tokens;

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, weak) IBOutlet UIView * woodoView;
@property (nonatomic, readwrite) WPRemoteControl *remoteControl;

@end

@implementation ViewController

#define iPad [UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad

#pragma mark - Methods

-(void)createWoodoViewControllerToken:(NSString*)token andVideoURl:(NSURL *)url andShareText:(NSString*)shareText andShareTitle:(NSString*)shareTitle
{
    
    UIView *attachmentView = [WPDefaultVideoControllerView new];
    
    if (iPad)
    {
        
        self.remoteControl = [[WPManager sharedManager]
         addWoodoToView:self.woodoView
         url:url
         token:token
         attachmentView:attachmentView
         shareText:shareText
         shareUrls:nil
         shareImages:nil
         shareTitle:shareTitle
         shareRecipients:nil
         presentationHandler:nil
         startHandler:nil
         progressHandler:nil
         finishHandler:nil
         errorHandler:nil];
    }
    else
    {
        
    self.remoteControl = [[WPManager sharedManager]
     presentWoodoWithUrl:url
     token:token
     attachmentView:attachmentView
     shareText:shareText
     shareUrls:nil
     shareImages:nil
     shareTitle:shareTitle
     shareRecipients:nil
     presentationHandler:nil
     startHandler:nil
     progressHandler:nil
     finishHandler:nil
     errorHandler:nil];
        
    }
  
}

- (void)uiDesign
{
    
    UILabel * logoTitle = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 44.0)];
    
    [logoTitle setTextAlignment:NSTextAlignmentCenter];
    
    [logoTitle setText:@"Woodo-tv"];
    
    [logoTitle setTextColor:[UIColor whiteColor]];
    
    [logoTitle setBackgroundColor:[UIColor clearColor]];
    
    [logoTitle setFont:[UIFont fontWithName:@"OpenSans" size: iPad ? 27.0 : 24.0]];
    
    [self.navigationItem setTitleView:logoTitle];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0,iPad ? 318.0 :  320.0, iPad ? 704.0 : 504.0)];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    
    [self.tableView.layer setMasksToBounds:YES];
    
    [self.tableView.layer setBorderWidth:1.5];
    
    [self.tableView.layer setBorderColor:[UIColor colorWithRed:0.663 green:0.663 blue:0.667 alpha:1].CGColor];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    UIImageView * logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"woodotv_logo.png"]];
    
    if (iPad) {
        
        [logo setFrame:CGRectMake( self.view.frame.size.height - 229.0 ,  self.view.frame.size.width - 215.0,219.0 ,147.0 )];
        
    } else {
        
        [logo setFrame:CGRectMake( self.view.frame.size.width - 159.0 ,  self.view.frame.size.height - 164.0,149.0 ,92.0 )];
        
    }
    
    [self.view addSubview:logo];
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tokens = @[@"woodo-demo-preroll",@"woodo-demo-midroll",@"woodo-demo-postroll",@"woodo-demo-preroll-cta",@"woodo-demo-content-banner",@"woodo-demo-preroll-anket"];
    
    self.data = @[@"Preroll",@"Midroll",@"Postroll",@"Preroll+CTA",@"Content Banner",@"Preroll Anket"];
    
    [self uiDesign];
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - TableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60.0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * identifier = @"Cell";
    
    CustomCell  * cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    [cell.cellTitleLabel setText:[self.data objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell * cell = (CustomCell*)[tableView cellForRowAtIndexPath:indexPath];

    UIView * view = [[UIView alloc] initWithFrame:cell.frame];
    
    [view setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0]];
    
    [cell setSelectedBackgroundView:view];
    
    [cell setSelected:iPad animated:YES];

    [self createWoodoViewControllerToken:[self.tokens objectAtIndex:indexPath.row] andVideoURl:[NSURL URLWithString:@"http://fox-i.mncdn.com/v_foxtv_vod/_definist_/nv3gVU/videos/HDvideos/smil/smil:KARAGUL_BOLUM_36_mobil.smil/playlist.m3u8" ] andShareText:@"ShareText" andShareTitle:@"ShareTitle"];
    
}

- (IBAction)resume:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl resume];
    }
}

- (IBAction)pause:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl pause];
    }
}

- (IBAction)randomSeek:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl seekTo:[self randomFloat]];
    }
}

- (IBAction)randomVolume:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl setVolume:[self randomFloat]];
    }
}

- (IBAction)save:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl saveState];
    }
}

- (IBAction)load:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl loadState];
    }
}

- (IBAction)terminate:(id)sender
{
    if (self.remoteControl)
    {
        [self.remoteControl close];
    }
}

- (CGFloat) randomFloat
{
    CGFloat r = arc4random() % 100;
    
    return r * 0.01;
}

@end
