//
//  BailBondsViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "BailBondsViewController.h"
#import "BailBondsTableViewController.h"
#import "AddBondsViewController.h"

@interface BailBondsViewController ()<UITextFieldDelegate, AddBondsDelegate>{

}

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSString *searchString;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *locationButton;
@property (strong, nonatomic) IBOutlet UIButton *zipButton;
@property (strong, nonatomic) IBOutlet UIButton *nameButton;
@property (strong, nonatomic) IBOutlet UIButton *addEditButton;

//@property (strong, nonatomic) NSMutableArray *bailBondsArray;

@end

@implementation BailBondsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    CALayer *locationLayer = _locationButton.layer;
    locationLayer = [self gradientBGLayerForBounds:_locationButton.bounds];
    locationLayer.cornerRadius = 10;
    UIGraphicsBeginImageContext(locationLayer.bounds.size);
    [locationLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *locationImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    if (locationImage != nil)
    {
        [_locationButton setBackgroundImage:locationImage forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"Failded to create gradient bg image, user will see standard tint color gradient.");
    }
    
    [self.view bringSubviewToFront:_locationButton];
    
    CALayer *zipLayer = _zipButton.layer;
    zipLayer = [self gradientBGLayerForBounds:_zipButton.bounds];
    zipLayer.cornerRadius = 10;
    
    UIGraphicsBeginImageContext(zipLayer.bounds.size);
    [zipLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *zipImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    if (zipImage != nil)
    {
        [_zipButton setBackgroundImage:zipImage forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"Failded to create gradient bg image, user will see standard tint color gradient.");
    }
    
    [self.view bringSubviewToFront:_zipButton];
    
    CALayer *nameLayer = _nameButton.layer;
    nameLayer = [self gradientBGLayerForBounds:_nameButton.bounds];
    nameLayer.cornerRadius = 10;
    
    UIGraphicsBeginImageContext(nameLayer.bounds.size);
    [nameLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *nameImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    if (nameImage != nil)
    {
        [_nameButton setBackgroundImage:nameImage forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"Failded to create gradient bg image, user will see standard tint color gradient.");
    }
    
    [self.view bringSubviewToFront:_nameButton];
    
    CALayer *addEditLayer = _addEditButton.layer;
    addEditLayer = [self gradientBGLayerForBounds:_addEditButton.bounds];
    addEditLayer.cornerRadius = 10;
    
    UIGraphicsBeginImageContext(addEditLayer.bounds.size);
    [addEditLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *addEditImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    if (addEditImage != nil)
    {
        [_addEditButton setBackgroundImage:addEditImage forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"Failded to create gradient bg image, user will see standard tint color gradient.");
    }
    
    [self.view bringSubviewToFront:_addEditButton];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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

-(void)transitionToAttorneyList
{
    [self performSegueWithIdentifier:@"toBondsList" sender:nil];
}

-(void)saveBondsmenWithDict:(NSDictionary *)dict
{
    [[NSUserDefaults standardUserDefaults]setObject:dict forKey:@"BondsProfile"];
    [[NSUserDefaults standardUserDefaults]synchronize];
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
    if([segue.destinationViewController isKindOfClass:[BailBondsTableViewController class]])
    {
        BailBondsTableViewController *tController = segue.destinationViewController;
        if([[segue identifier] isEqualToString:@"toBondsListByCity"]){
            _searchString = @"City";
            tController.preQuery = _appDelegate.placemark.locality;
        }
        
        else if([[segue identifier] isEqualToString:@"toBondsListByZip"]){
            _searchString = @"Zip";
            tController.preQuery = _appDelegate.placemark.postalCode;
        }
        
        else if([[segue identifier] isEqualToString:@"toBondsListByName"]){
            _searchString = @"Name";
        }
        tController.searchString = _searchString;
    }
    
    else if([segue.destinationViewController isKindOfClass:[AddBondsViewController class]])
    {
        AddBondsViewController *abvc = (AddBondsViewController *)segue.destinationViewController;
        abvc.delegate = self;
    }
}

-(void)transitionToAttorneyListByCity
{
    [self performSegueWithIdentifier:@"toBondsListByCity" sender:nil];
}

-(void)transitionToAttorneyListByName
{
    [self performSegueWithIdentifier:@"toBondsListByName" sender:nil];
}

-(void)transitionToAttorneyListByZip
{
    [self performSegueWithIdentifier:@"toBondsListByZip" sender:nil];
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

@end
