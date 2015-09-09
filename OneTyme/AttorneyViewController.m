//
//  AttorneyViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/27/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#define kOFFSET_FOR_KEYBOARD 140.0
#define ATTORNEY_OBJECTS_KEY @"Attorney Objects Key"
#import "AttorneyViewController.h"
#import "AppDelegate.h"
#import "AttorneyTableViewController.h"
#import <Parse/Parse.h>
#import "AddAttorneyViewController.h"

@interface AttorneyViewController ()<UITextFieldDelegate,AttorneyTableViewControllerDelegate, AddAttorneyDelegate>
{
    
}

@property (strong, nonatomic) IBOutlet UIButton *nameButton;
@property (strong, nonatomic) IBOutlet UIButton *zipButton;
@property (strong, nonatomic) IBOutlet UIButton *locationButton;
@property (strong, nonatomic) IBOutlet UIButton *addEditButton;
@property (strong, nonatomic) NSString *searchString;
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSDictionary *attorneyDict;

@end

@implementation AttorneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_locationButton setBackgroundImage:[UIImage imageNamed:@"Current-Location.png"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:_locationButton];
    
    [_zipButton setBackgroundImage:[UIImage imageNamed:@"Zip-Code.png"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:_zipButton];
    
    
    [_nameButton setBackgroundImage:[UIImage imageNamed:@"Name.png"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:_nameButton];


    [_addEditButton setBackgroundImage:[UIImage imageNamed:@"Add-Edit-Bail.png"] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:_addEditButton];
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addSearchLocation:(id)sender
{
    [self transitionToAttorneyListByCity];
}

-(IBAction)addSearchName:(id)sender
{
    [self transitionToAttorneyListByName];
}

-(IBAction)addSearchZip:(id)sender
{
    [self transitionToAttorneyListByZip];
}

-(void)transitionToAttorneyListByCity
{
    [self performSegueWithIdentifier:@"toAttorneyListByCity" sender:nil];
}

-(void)transitionToAttorneyListByName
{
    [self performSegueWithIdentifier:@"toAttorneyListByName" sender:nil];
}

-(void)transitionToAttorneyListByZip
{
    [self performSegueWithIdentifier:@"toAttorneyListByZip" sender:nil];
}

-(void)saveAttorneyWithDict:(NSDictionary *)dict
{
    [[NSUserDefaults standardUserDefaults]setObject:dict forKey:@"AttorneyProfile"];
    _attorneyDict = dict;
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self.delegate didUpdate];
}

-(void)checkEditing:(BOOL)editing
{
    if(editing == YES){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:@"You have successfully edited your attorney information." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:@"You have successfully added your attorney." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [   alertView show];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.destinationViewController isKindOfClass:[AttorneyTableViewController class]])
    {
        AttorneyTableViewController *tController = segue.destinationViewController;
        if([[segue identifier] isEqualToString:@"toAttorneyListByCity"]){
            _searchString = @"City";
            tController.preQuery = _appDelegate.placemark.locality;
            NSLog(@"%@", _appDelegate.placemark.locality);
        }
        
        else if([[segue identifier] isEqualToString:@"toAttorneyListByZip"]){
            _searchString = @"Zip";
            tController.preQuery = _appDelegate.placemark.postalCode;
        }
        
        else if([[segue identifier] isEqualToString:@"toAttorneyListByName"]){
            _searchString = @"Name";
        }
        tController.searchString = _searchString;
    }
    
    else if([[segue identifier]isEqualToString:@"toAddEdit"])
    {
        AddAttorneyViewController *aavc = (AddAttorneyViewController *)segue.destinationViewController;
        aavc.delegate = self;
    }
}


- (CALayer *)gradientBGLayerForBounds:(CGRect)bounds
{
    CAGradientLayer * gradientBG = [CAGradientLayer layer];
    gradientBG.frame = bounds;
    gradientBG.colors = [NSArray arrayWithObjects:
                         (id)[[UIColor blackColor] CGColor],
                         (id)[[UIColor darkGrayColor] CGColor],
                         nil];
    return gradientBG;
}

@end
