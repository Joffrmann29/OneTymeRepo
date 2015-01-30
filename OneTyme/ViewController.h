//
//  ViewController.h
//  OneTyme
//
//  Created by Joffrey Mann on 1/27/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

