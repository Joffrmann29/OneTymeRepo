//
//  LoginViewController.m
//  onetyme
//
//  Created by Joffrey Mann on 8/20/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import <PFFacebookUtils.h>

@interface LoginViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITextFieldDelegate Methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]){
        [self performSegueWithIdentifier:@"toHome" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)getUserData
{
    NSArray *permissionsArray = @[@"user_about_me", @"user_interests", @"user_relationships", @"user_birthday", @"user_location", @"user_relationship_details"];
    
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user){
            if (!error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"The Facebook Login was Canceled" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
            else {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
        }
        if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]){
            [self performSegueWithIdentifier:@"toHome" sender:self];
            [_hud hide:YES];
        }
        else{
            //[self performSegueWithIdentifier:@"toProfile" sender:nil];
        }
    }];
}


- (IBAction)loginToOneTyme:(id)sender {
    [self getUserData];
    //show loading indicator
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Logging In";
}

- (IBAction)goToRegister:(id)sender {
    [self performSegueWithIdentifier:@"toRegister" sender:sender];
}
@end
