//
//  LifeLineViewController.h
//  OneTyme
//
//  Created by Joffrey Mann on 1/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LIFELINE_OBJECTS_KEY @"Lifeline Objects Key"

@interface LifeLineViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


- (IBAction)addLifeline:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
