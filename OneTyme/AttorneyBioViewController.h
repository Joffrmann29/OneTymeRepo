//
//  AttorneyBioViewController.h
//  onetyme
//
//  Created by Joffrey Mann on 8/31/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AttorneyBioViewController : UIViewController

@property (strong, nonatomic) PFObject *attorney;

@end