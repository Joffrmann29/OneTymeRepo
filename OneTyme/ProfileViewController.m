//
//  ProfileViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 3/3/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface ProfileViewController ()<UITextFieldDelegate,UIScrollViewDelegate,UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *addressField;
@property (nonatomic, strong) IBOutlet UITextField *cityField;
@property (nonatomic, strong) IBOutlet UITextField *stateField;
@property (nonatomic, strong) IBOutlet UITextField *zipField;
@property (nonatomic, strong) IBOutlet UITextField *phoneField;
@property (nonatomic, strong) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextField *dobField;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) AppDelegate *appDelegate;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)saveProfile:(id)sender;
- (IBAction)backHome:(id)sender;
@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*1.8);
    
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    PFUser *currentUser = [PFUser currentUser];
        
    self.nameField.text = currentUser[@"Name"];
    self.addressField.text = currentUser[@"Address"];
    self.cityField.text = currentUser[@"City"];
    self.stateField.text = currentUser[@"State"];
    self.zipField.text = currentUser[@"Zip"];
    self.emailField.text = currentUser[@"email"];
    self.phoneField.text = currentUser[@"Phone"];
    self.dobField.text = currentUser[@"DateOfBirth"];
    self.textView.text = currentUser[@"Message"];
        
        if(![currentUser[@"Message"] isEqualToString:@""])
        {
            self.textView.text = [NSString stringWithFormat:@"%@: %@" , currentUser[@"Name"], currentUser[@"Message"]];
        }

    _nameField.delegate = self;
    _addressField.delegate = self;
    _cityField.delegate = self;
    _stateField.delegate = self;
    _addressField.delegate = self;
    _zipField.delegate = self;
    _phoneField.delegate = self;
    _emailField.delegate = self;
    _dobField.delegate = self;
    _textView.delegate = self;
    
    UIToolbar *phoneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    phoneToolbar.barStyle = UIBarStyleBlackTranslucent;
    phoneToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithPhonePad)]];
    UIImage *toolbarImage = [self imageForBounds:phoneToolbar.bounds];
    
    [phoneToolbar setBackgroundImage:toolbarImage forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [phoneToolbar setTintColor:[UIColor whiteColor]];
    [phoneToolbar sizeToFit];
    _phoneField.inputAccessoryView = phoneToolbar;

    
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

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)saveProfile:(id)sender
{
    if([self.nameField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide name" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([self.addressField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([self.cityField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide your city" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([self.stateField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide state" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([self.zipField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide zip code" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if ([self.emailField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }

    else if ([self.phoneField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide your Phone number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([self.textView.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Provide your Phone number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        PFUser *currentUser = [PFUser currentUser];
        [currentUser setObject:_nameField.text forKey:@"Name"];
        [currentUser setObject:_addressField.text forKey:@"Address"];
        [currentUser setObject:_cityField.text forKey:@"City"];
        [currentUser setObject:_stateField.text forKey:@"State"];
        [currentUser setObject:_zipField.text forKey:@"Zip"];
        [currentUser setObject:_textView.text forKey:@"Message"];
        [currentUser setObject:_dobField.text forKey:@"DateOfBirth"];
        [currentUser setObject:_phoneField.text forKey:@"Phone"];
        [currentUser saveInBackground];
        
        [self showAlert];
        
    }
}

- (IBAction)backHome:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) showAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"User Profile has been saved succesfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
