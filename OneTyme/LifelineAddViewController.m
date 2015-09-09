//
//  LifelineAddViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#define kOFFSET_FOR_KEYBOARD 165.0
#import "LifelineAddViewController.h"
#import "AppDelegate.h"

@interface LifelineAddViewController ()<UITextFieldDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;
@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *addressField;
@property (nonatomic, strong) IBOutlet UITextField *cityField;
@property (nonatomic, strong) IBOutlet UITextField *stateField;
@property (nonatomic, strong) IBOutlet UITextField *zipField;
@property (nonatomic, strong) IBOutlet UITextField *phoneField;
@property (nonatomic, strong) IBOutlet UITextField *emailField;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation LifelineAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    
//    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
//    self.scrollView.delegate = self;
//    if([[_appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]) self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.3);
//    else if(![[_appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]) self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2.1);
//    
//    UIImageView *oneTymeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AttorneyBackground.png"]];
//    oneTymeImage.frame = CGRectMake(0, 64, self.view.frame.size.width, 663);
//    [self.view addSubview:oneTymeImage];
    CAGradientLayer * gradientBG = [CAGradientLayer layer];
    gradientBG.frame = _saveButton.bounds;
    gradientBG.colors = [NSArray arrayWithObjects:
                         (id)[[UIColor blackColor] CGColor],
                         (id)[[UIColor darkGrayColor] CGColor],
                         nil];
    self.saveButton.layer.cornerRadius = 10;
    self.saveButton.clipsToBounds = YES;
    [self.saveButton.layer insertSublayer:gradientBG atIndex:0];
    _nameField.delegate = self;
    _addressField.delegate = self;
    _cityField.delegate = self;
    _stateField.delegate = self;
    _zipField.delegate = self;
    _phoneField.delegate = self;
    _emailField.delegate = self;
    [self loadFields];
    
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

-(void)loadFields
{
    if(_isEdit)
    {
        _nameField.text = _localLifeline.name;
        _addressField.text = _localLifeline.address;
        _cityField.text = _localLifeline.city;
        _stateField.text = _localLifeline.state;
        _zipField.text = _localLifeline.zipCode;
        _phoneField.text = _localLifeline.phone;
        _emailField.text = _localLifeline.email;
    }
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

-(IBAction)saveLifeLine:(id)sender
{
    if(![_nameField.text isEqualToString:@""] && ![_addressField.text isEqualToString:@""] && ![_cityField.text isEqualToString:@""] && ![_stateField.text isEqualToString:@""] && ![_zipField.text isEqualToString:@""] && ![_phoneField.text isEqualToString:@""]  && ![_emailField.text isEqualToString:@""] && _isEdit == NO)
    {
        [self.delegate didAddLifeline:[self returnNewLifeline]];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Life line saved succesfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 99;
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(![_nameField.text isEqualToString:@""] && ![_addressField.text isEqualToString:@""] && ![_cityField.text isEqualToString:@""] && ![_stateField.text isEqualToString:@""] && ![_zipField.text isEqualToString:@""] && ![_phoneField.text isEqualToString:@""] && ![_emailField.text isEqualToString:@""] && _isEdit == YES)
    {
        [self didUpdateLifeLine];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Life line edited succesfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must complete all the required fields." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
}

-(void)didUpdateLifeLine
{
    _controller.delegate = self;
    self.localLifeline.name = self.nameField.text;
    self.localLifeline.address = self.addressField.text;
    self.localLifeline.city = self.cityField.text;
    self.localLifeline.state = self.stateField.text;
    self.localLifeline.zipCode = self.zipField.text;
    self.localLifeline.phone = self.phoneField.text;
    self.localLifeline.email = self.emailField.text;
    [self.delegate editLifeline:self.localLifeline];
}

-(LifeLine *)returnNewLifeline
{
    LifeLine *lifelineObject = [[LifeLine alloc] init];
    lifelineObject.name = self.nameField.text;
    lifelineObject.address= self.addressField.text;
    lifelineObject.city = self.cityField.text;
    lifelineObject.state = self.stateField.text;
    lifelineObject.zipCode = self.zipField.text;
    lifelineObject.phone = self.phoneField.text;
    lifelineObject.email = self.emailField.text;
    
    return lifelineObject;
}

- (IBAction)showContacts:(id)sender {
    [self showPeoplePickerController];
}

#pragma mark Show all contacts
// Called when users tap "Display Picker" in the application. Displays a list of contacts and allows users to select a contact from that list.
// The application only shows the phone, email, and birthdate information of the selected contact.
-(void)showPeoplePickerController
{
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    picker.topViewController.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    // Display only a person's phone, email, and birthdate
    NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty],
                               [NSNumber numberWithInt:kABPersonEmailProperty],
                               [NSNumber numberWithInt:kABPersonBirthdayProperty],
                               [NSNumber numberWithInt:kABPersonAddressProperty], nil];
    
    picker.displayedProperties = displayedItems;
    // Show the picker
    [self presentViewController:picker animated:YES completion:nil];
    if(_isEdit)
    self.nameField.text = nil;
    self.addressField.text = nil;
    self.cityField.text = nil;
    self.stateField.text = nil;
    self.zipField.text = nil;
    self.phoneField.text = nil;
    self.emailField.text = nil;
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person;
{
    [self peoplePickerNavigationController:peoplePicker shouldContinueAfterSelectingPerson:person];
}

#pragma mark ABPeoplePickerNavigationControllerDelegate methods
// Displays the information of a selected person
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    NSMutableDictionary *contactDict = [[NSMutableDictionary alloc]initWithObjects:@[@"", @"", @"", @"", @"", @"", @"", @""]
    forKeys:@[@"firstName", @"lastName", @"address", @"city", @"state", @"zip", @"phone", @"e-mail"]];
    NSString *firstname = (__bridge  NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *lastname= (__bridge  NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    
    self.nameField.text = [NSString stringWithFormat:@"%@ %@",firstname,lastname];
    
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    self.phoneField.text = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, 0);
    
    ABMultiValueRef aMulti = ABRecordCopyValue(person, kABPersonAddressProperty);
    if (ABMultiValueGetCount(aMulti) > 0) {
            NSDictionary *abDict = (__bridge NSDictionary *)ABMultiValueCopyValueAtIndex(aMulti, 0);
        NSString  *address = [abDict objectForKey:(NSString *)kABPersonAddressStreetKey];
        [contactDict setObject:address forKey:@"address"];
        NSString *zip = [abDict objectForKey:(NSString *)kABPersonAddressZIPKey];
        [contactDict setObject:zip forKey:@"zip"];
        NSString *city = [abDict objectForKey:(NSString *)kABPersonAddressCityKey];
        [contactDict setObject:city forKey:@"city"];
        NSString *state = [abDict objectForKey:(NSString *)kABPersonAddressStateKey];
        [contactDict setObject:state forKey:@"state"];
        [contactDict setObject:(__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, 0) forKey:@"phone"];
        [contactDict setObject:(__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, 0) forKey:@"secondaryPhone"];
        
        NSLog(@"%@", contactDict);
        _addressField.text = contactDict[@"address"];
        _cityField.text = contactDict[@"city"];
        _stateField.text = contactDict[@"state"];
        _zipField.text = contactDict[@"zip"];
        CFRelease(aMulti);
    }
    
    ABMultiValueRef emailMultiValue = ABRecordCopyValue(person, kABPersonEmailProperty);
    NSArray *emailAddresses = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(emailMultiValue);
    //CFRelease(emailMultiValue);
    
    if([emailAddresses count]>0)
    {
        self.emailField.text = [emailAddresses objectAtIndex:0];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return YES;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

// Dismisses the people picker and shows the application when users tap Cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker;
{
    [self loadFields];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
