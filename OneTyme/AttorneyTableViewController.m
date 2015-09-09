//
//  AttorneyTableViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 3/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AttorneyTableViewController.h"
#import "AttorneyDetailViewController.h"
#import "AttorneyBioViewController.h"

@implementation AttorneyTableViewController
MBProgressHUD *hud;
UIAlertView *searchByNameAlert;
UIAlertView *searchByLocationAlert;
UIAlertView *searchByZipAlert;
UIAlertView *alertView;
UITextField *textField;

-(NSMutableArray *)paidAttorneys
{
    if(!_paidAttorneys) _paidAttorneys = [NSMutableArray array]; return _paidAttorneys;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = [NSString stringWithFormat:@"Attorneys by %@", _searchString];
    NSLog(@"%@", _preQuery);
    [self retrieveAttorneys];
    
    self.tableView.backgroundColor = [UIColor darkGrayColor];
    
    [self loadingOverlay];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    _searchString = nil;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    textField =  [alertView textFieldAtIndex: 0];
    
    if(buttonIndex == 1 ){
        if (textField.text.length > 0)
        {
            NSLog(@"textfield = %@", textField.text);
            self.searchQuery = textField.text;
            [self retrieveAttorneysBySearch];
            [self loadingOverlay];
        }
        
        else
        {
            NSLog(@"textfield = %@", textField.text);
            self.searchQuery = _preQuery;
            [self retrieveAttorneysBySearch];
            [self loadingOverlay];
        }
    }
}

-(void)loadingOverlay
{
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Attorneys";
}

-(void) retrieveAttorneysBySearch{
    PFQuery *retrieveAttorney = [PFQuery queryWithClassName:@"Attorney"];
    [retrieveAttorney whereKey:_searchString equalTo:_searchQuery];
    [retrieveAttorney findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _paidAttorneys = [objects mutableCopy];
            if([objects count] == 0){
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No results found" message:@"Please search again." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertView show];
            }
            NSLog(@"%@", objects);
            [self.tableView reloadData];
            [hud hide:YES];
        }
        else{
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void) retrieveAttorneys{
    PFQuery *retrieveAttorney = [PFQuery queryWithClassName:@"Attorney"];
    [retrieveAttorney findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _paidAttorneys = [objects mutableCopy];
            NSLog(@"%@", objects);
            [self.tableView reloadData];
            [hud hide:YES];
        }
        else{
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_paidAttorneys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *attorney = _paidAttorneys[indexPath.row];
    
    PFFile *file = attorney[@"ProfilePic"];
    
    UIImage *finalImage;
    
    if(file != nil)
    {
        NSData *imageData = [file getData];
        UIImage *image = [UIImage imageWithData:imageData];
        finalImage = [self resizeImage:image];
        cell.imageView.image = finalImage;
    }
    
    else
    {
        finalImage = [self resizeImage:[UIImage imageNamed:@"AttorneySelected.png"]];
    }
    
    cell.tintColor = [UIColor whiteColor];
    cell.imageView.image = finalImage;
    cell.textLabel.text = attorney[@"Name"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@, %@, %@", attorney[@"Address"], attorney[@"City"], attorney[@"State"], attorney[@"Zip"]];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    PFObject *attorney = _paidAttorneys[indexPath.row];
    NSString *url = attorney[@"url"];
    
    if(url != nil)
    {
        [self performSegueWithIdentifier:@"toAttorneyDetail" sender:indexPath];
    }
    
    else
    {
        [self performSegueWithIdentifier:@"toAttorneyBio" sender:indexPath];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UIImage *)resizeImage:(UIImage *)image
{
    CGRect rect = CGRectMake(0, 0, 75, 75);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *transformedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(transformedImage);
    UIImage *finalImage = [UIImage imageWithData:imgData];
    
    return finalImage;
}

- (IBAction)searchAttorneys:(id)sender
{
    if([_searchString isEqualToString:@"Name"]){
        searchByNameAlert = [[UIAlertView alloc] initWithTitle:@"Search By Name"
                                                       message:@"Please search for an attorney by name"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        searchByNameAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [searchByNameAlert show];
    }
    
    else if([_searchString isEqualToString:@"City"]){
        NSString *titleMessage = [NSString stringWithFormat:@"You are currently located in %@", _preQuery];
        searchByLocationAlert = [[UIAlertView alloc] initWithTitle:titleMessage
                                                           message:@"If you would like to search another city, please enter one."
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"OK",nil];
        searchByLocationAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [searchByLocationAlert show];
    }
    
    else if([_searchString isEqualToString:@"Zip"]){
        NSString *titleMessage = [NSString stringWithFormat:@"You are currently located in %@", _preQuery];
        searchByZipAlert = [[UIAlertView alloc] initWithTitle:titleMessage
                                                      message:@"If you would like to search another zip code, please enter one."
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"OK",nil];
        searchByZipAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [searchByZipAlert show];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = sender;
    PFObject *attorney = self.paidAttorneys[indexPath.row];
    if([segue.destinationViewController isKindOfClass:[AttorneyDetailViewController class]])
    {
        AttorneyDetailViewController *detailController = (AttorneyDetailViewController *)segue.destinationViewController;
        detailController.attorney = attorney;
    }
    
    else
    {
        AttorneyBioViewController *bioController = (AttorneyBioViewController *)segue.destinationViewController;
        bioController.attorney = attorney;
    }
}

@end
