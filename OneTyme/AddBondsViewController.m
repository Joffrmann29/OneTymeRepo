//
//  AddBondsViewController.m
//  onetyme
//
//  Created by Joffrey Mann on 8/7/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AddBondsViewController.h"
#import "BailBonds.h"
#import "AppDelegate.h"

@interface AddBondsViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) NSArray *bondsmen;
@property (strong, nonatomic) NSURL *bondsURL;

@end

@implementation AddBondsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*1.8);
    
    _nameField.delegate = self;
    _addressField.delegate = self;
    _cityField.delegate = self;
    _stateField.delegate = self;
    _zipField.delegate = self;
    _phoneField.delegate = self;
    _secondaryPhoneField.delegate = self;
    _emailField.delegate = self;
    
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    self.bondsURL = [[urls lastObject] URLByAppendingPathComponent:@"bonds.data"];
    
    NSData *data = [NSData dataWithContentsOfURL:self.bondsURL];
    _bondsmen = [[NSKeyedUnarchiver unarchiveObjectWithData:data]mutableCopy];
    
    BailBonds *savedBondsmen = _bondsmen[0];
    
    if(savedBondsmen != nil)
    {
        _nameField.text = savedBondsmen.name;
        _addressField.text = savedBondsmen.address;
        _cityField.text = savedBondsmen.city;
        _stateField.text = savedBondsmen.state;
        _zipField.text = savedBondsmen.zipCode;
        _phoneField.text = savedBondsmen.phone;
        _secondaryPhoneField.text = savedBondsmen.secondaryPhone;
        _emailField.text = savedBondsmen.email;
    }
    
    CAGradientLayer * gradientBG = [CAGradientLayer layer];
    gradientBG.frame = _saveButton.bounds;
    gradientBG.colors = [NSArray arrayWithObjects:
                         (id)[[UIColor blackColor] CGColor],
                         (id)[[UIColor darkGrayColor] CGColor],
                         nil];
    self.saveButton.layer.cornerRadius = 10;
    self.saveButton.clipsToBounds = YES;
    [self.saveButton.layer insertSublayer:gradientBG atIndex:0];
    
    
    UIToolbar *phoneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    phoneToolbar.barStyle = UIBarStyleBlackTranslucent;
    phoneToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                  [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithPhonePad)]];
    UIImage *toolbarImage = [self imageForBounds:phoneToolbar.bounds];
    
    [phoneToolbar setBackgroundImage:toolbarImage forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [phoneToolbar setTintColor:[UIColor whiteColor]];
    [phoneToolbar sizeToFit];
    _phoneField.inputAccessoryView = phoneToolbar;
    
    UIToolbar* secondaryToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    secondaryToolbar.barStyle = UIBarStyleBlackTranslucent;
    secondaryToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithSecondaryPad)]];
    [secondaryToolbar setTintColor:[UIColor whiteColor]];
    [secondaryToolbar setBackgroundImage:toolbarImage forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [secondaryToolbar sizeToFit];
    _secondaryPhoneField.inputAccessoryView = secondaryToolbar;
    
    UIToolbar *zipToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    zipToolbar.barStyle = UIBarStyleBlackTranslucent;
    zipToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                               [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithZipPad)]];
    [zipToolbar setTintColor:[UIColor whiteColor]];
    [zipToolbar setBackgroundImage:toolbarImage forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [zipToolbar sizeToFit];
    _zipField.inputAccessoryView = zipToolbar;
}

-(void)doneWithPhonePad
{
    [_phoneField resignFirstResponder];
}

-(void)doneWithSecondaryPad
{
    [_secondaryPhoneField resignFirstResponder];
}

-(void)doneWithZipPad
{
    [_zipField resignFirstResponder];
}

-(UIImage *)imageForBounds:(CGRect)bounds
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    CALayer * bgGradientLayer = [delegate gradientBGLayerForBounds:bounds];
    UIGraphicsBeginImageContext(bgGradientLayer.bounds.size);
    [bgGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *toolbarImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return toolbarImage;
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

-(void)formBondsObject
{
    if([_nameField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide name" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([_addressField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([_cityField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide your city" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([_stateField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide state" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([_zipField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide zip" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([_emailField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([_phoneField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide your Phone number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([_secondaryPhoneField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide your Secondary Phone number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        [self writeBondsmenToFilesystem:[self bondsWithValues]];
    }
}

-(void)writeBondsmenToFilesystem:(BailBonds *)bondsmen
{
    NSData *data = [NSData dataWithContentsOfURL:self.bondsURL];
    NSMutableArray *mBondsmen = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    [mBondsmen insertObject:bondsmen atIndex:0];
    NSData *fileData = [NSKeyedArchiver archivedDataWithRootObject:mBondsmen];
    [fileData writeToURL:self.bondsURL atomically:YES];
    
    NSString *messageString = [NSString stringWithFormat:@"%@ has been saved as your personal bail bondsmen.", bondsmen.name];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:messageString  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
}

-(BailBonds *)bondsWithValues
{
    BailBonds *bondsmenToSave = [[BailBonds alloc]init];
    bondsmenToSave.name = _nameField.text;
    bondsmenToSave.address = _addressField.text;
    bondsmenToSave.city = _cityField.text;
    bondsmenToSave.state = _stateField.text;
    bondsmenToSave.zipCode = _zipField.text;
    bondsmenToSave.phone = _phoneField.text;
    bondsmenToSave.secondaryPhone = _secondaryPhoneField.text;
    bondsmenToSave.email = _emailField.text;
    
    return bondsmenToSave;
}

- (IBAction)saveButtonPressed:(id)sender {
    [self formBondsObject];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
