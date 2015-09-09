//
//  ViewController.h
//  OneTyme
//
//  Created by Joffrey Mann on 1/27/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>



@interface ViewController : UIViewController<UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString *attorneyString;
@property (nonatomic,strong) UIView *alertView;
@property (nonatomic, strong) UILabel *alertLabel;
@property (nonatomic,readwrite) int currentCount;
@property (nonatomic, retain) NSTimer *timerAlert;
- (IBAction)shareOneTyme:(id)sender;
- (IBAction)addProfile:(id)sender;
- (IBAction)showInfoPage:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIButton *addProfileButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;

@end

