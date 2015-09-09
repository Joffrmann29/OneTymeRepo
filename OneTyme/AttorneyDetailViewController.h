//
//  AttorneyDetailViewController.h
//  onetyme
//
//  Created by Joffrey Mann on 4/13/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AttorneyDetailViewController : UIViewController

-(void)loadWebsite;
@property (strong, nonatomic) PFObject *attorney;
@end
