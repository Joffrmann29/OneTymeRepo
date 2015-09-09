//
//  ViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/27/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
#import "Attorney.h"
#import "BailBonds.h"
#import "LifeLine.h"
#import "AppDelegate.h"
#import "AttorneyViewController.h"
#import "BailBondsViewController.h"
#import "LifeLineViewController.h"
#import <Mailgun.h>
#import <TwilioClient.h>

@interface ViewController ()<MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate,NSURLConnectionDelegate, NSURLSessionDelegate, AttorneyUpdateDelegate>

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSArray *attorneysAsPropertyLists;
@property (strong, nonatomic) NSArray *bailBondsAsPropertyLists;
@property (strong, nonatomic) NSArray *lifelineAsPropertyLists;
@property (strong, nonatomic) UIButton *pushButton;
@property (strong, nonatomic) Attorney *savedAttorney;
@property (strong, nonatomic) BailBonds *savedBondsmen;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSURL *attorneyURL;
@property (strong, nonatomic) NSURL *bondsURL;
@property (strong, nonatomic) IBOutlet UIImageView *oneTymeIMG;
@property (strong, nonatomic) IBOutlet UIImageView *tickerView;

@end

@implementation ViewController
NSArray *toRecipients;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    // Do any additional setup after loading the view, typically from a nib.

    AttorneyViewController *avc = [[AttorneyViewController alloc]init];
    avc.delegate = self;
    
    UIImageView *oneTymeIMG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"onetymepng.png"]];
    
    UIImageView *tickerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"OneTymeTick.png"]];
    if([[_appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        //_pushButton.frame = CGRectMake(117, 140, 180, 180);
        oneTymeIMG.frame = CGRectMake(105.5, 370, 203, 115);
        oneTymeIMG.center=self.view.center;
        [self.view addSubview:oneTymeIMG];
        _oneTymeIMG.hidden = YES;

        tickerView.frame = CGRectMake(0, 507, 414, 20);
        [self.view addSubview:tickerView];
        _tickerView.hidden = YES;
    }
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    CGRect tabBounds = CGRectMake(0, 0, self.view.frame.size.width, 44);
    self.tabBarController.tabBar.bounds = tabBounds;
    
    CALayer * bgGradientLayer = [self gradientBGLayerForBounds:tabBounds];
    UIGraphicsBeginImageContext(bgGradientLayer.bounds.size);
    [bgGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * bgAsImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (bgAsImage != nil)
    {
        [self.tabBarController.tabBar setBackgroundImage:bgAsImage];
    }
    else
    {
        NSLog(@"Failded to create gradient bg image, user will see standard tint color gradient.");
    }
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    CAGradientLayer *redShareLayer = [CAGradientLayer layer];
    redShareLayer.frame = _shareButton.bounds;
    redShareLayer.colors = [NSArray arrayWithObjects:
                              (id)[[UIColor darkGrayColor] CGColor],
                              (id)[[UIColor darkTextColor] CGColor],
                              nil];
    _shareButton.layer.cornerRadius = 10;
    _shareButton.clipsToBounds = YES;
    [_shareButton.layer insertSublayer:redShareLayer atIndex:0];
    [self.view bringSubviewToFront:_shareButton];
    
    CAGradientLayer *redProfileLayer = [CAGradientLayer layer];
    redProfileLayer.frame = _addProfileButton.bounds;
    redProfileLayer.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor darkGrayColor] CGColor],
                       (id)[[UIColor darkTextColor] CGColor],
                       nil];
    _addProfileButton.layer.cornerRadius = 10;
    _addProfileButton.clipsToBounds = YES;
    [_addProfileButton.layer insertSublayer:redProfileLayer atIndex:1];
    [self.view bringSubviewToFront:_addProfileButton];
    
    CAGradientLayer *redLayer = [CAGradientLayer layer];
    redLayer.frame = _infoButton.bounds;
    redLayer.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor darkGrayColor] CGColor],
                       (id)[[UIColor darkTextColor] CGColor],
                        nil];
    _infoButton.layer.cornerRadius = 10;
    _infoButton.clipsToBounds = YES;
    [_infoButton.layer insertSublayer:redLayer atIndex:2];
    [self.view bringSubviewToFront:_infoButton];
    
    self.tabBarController.tabBar.opaque = NO;
    
    NSArray *items = self.tabBarController.tabBar.items;
    
    for (UITabBarItem *tbi in items) {
        UIImage *image = tbi.image;
        tbi.selectedImage = image;
        tbi.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    
    _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _attorneyString = @"Joffrey";
}

-(void)viewWillAppear:(BOOL)animated
{
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    self.attorneyURL = [[urls lastObject] URLByAppendingPathComponent:@"attorney.data"];
    
    NSData *data = [NSData dataWithContentsOfURL:self.attorneyURL];
    
    NSArray *bondsURLS = [[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    self.bondsURL = [[bondsURLS lastObject]URLByAppendingPathComponent:@"bonds.data"];
    NSData *bondData = [NSData dataWithContentsOfURL:self.bondsURL];
    
    _attorneysAsPropertyLists = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    _savedAttorney = _attorneysAsPropertyLists[0];
    NSLog(@"Saved Attorney: %@", _savedAttorney.name);
    _bailBondsAsPropertyLists = [NSKeyedUnarchiver unarchiveObjectWithData:bondData];
    _savedBondsmen = _bailBondsAsPropertyLists[0];
    _lifelineAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:LIFELINE_OBJECTS_KEY];
    _currentUser = [PFUser currentUser];
}

-(void)drawAlertTimer
{
    if([[_appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]) self.alertView =  [[UIView alloc]initWithFrame:CGRectMake(47, 435, 320, 130)];
    else self.alertView =  [[UIView alloc]initWithFrame:CGRectMake(0, 305, 320, 130)];
    UIImageView *alertImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AlertTicker.png"]];
    [self.alertView addSubview:alertImgView];
    self.alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 28, 42, 21)];
    self.alertLabel.textColor = [UIColor whiteColor];
    UIButton *cancelAlertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelAlertButton.frame = CGRectMake(131, 88, 98, 31);
    [cancelAlertButton addTarget:self action:@selector(removeAlertView) forControlEvents:UIControlEventTouchUpInside];
    [self.alertView addSubview:cancelAlertButton];
    [self.alertView addSubview:self.alertLabel];
    [self.view addSubview:self.alertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CALayer *)gradientBGLayerForBounds:(CGRect)bounds
{
    CAGradientLayer * gradientBG = [CAGradientLayer layer];
    gradientBG.frame = bounds;
    gradientBG.colors = [NSArray arrayWithObjects:
                         (id)[[UIColor colorWithRed:252.0f / 255.0f green:22.0f / 255.0f blue:22.0f / 255.0f alpha:1.0f] CGColor],
                         (id)[[UIColor colorWithRed:101.0f / 255.0f green:11.0f / 255.0f blue:11.0f / 255.0f alpha:1.0f] CGColor],
                         nil];
    return gradientBG;
}

-(IBAction)prepareToMail:(id)sender
{
    [self drawAlertTimer];
    self.alertLabel.text = @"10";
    _currentCount = 9;
    _timerAlert = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(changeText) userInfo:nil repeats:YES];
}

-(void)sendMailgunEmail
{
    NSString *email;
    NSDictionary *dictOne;
    NSDictionary *dictTwo;
    NSDictionary *dictThree;
    NSDictionary *dictFour;
    NSDictionary *dictFive;
    
    NSString *emailOne;
    NSString *emailTwo;
    NSString *emailThree;
    NSString *emailFour;
    NSString *emailFive;
    
    NSString *locationString;
    
    if(![_appDelegate.placemark.subThoroughfare isEqualToString:@""] && ![_appDelegate.placemark.thoroughfare isEqualToString:@""] && ![_appDelegate.placemark.locality isEqualToString:@""] && ![_appDelegate.placemark.administrativeArea isEqualToString:@""] && ![_appDelegate.placemark.postalCode isEqualToString:@""])
    {
    locationString = [NSString stringWithFormat:@"I am currently located at %@ %@, %@, %@, %@.", _appDelegate.placemark.subThoroughfare, _appDelegate.placemark.thoroughfare, _appDelegate.placemark.locality, _appDelegate.placemark.administrativeArea, _appDelegate.placemark.postalCode];
    }
    
    NSString *emailBody = [NSString stringWithFormat:@"%@ %@", _currentUser[@"Message"], locationString];
    Mailgun *mailgun;
    NSString *formattedRecipients;
    NSArray *textRecipientArray;
    if(_currentUser && _savedAttorney && _savedBondsmen && [_lifelineAsPropertyLists count] > 0) {
        if([_lifelineAsPropertyLists count] == 1)
        {
            dictOne = _lifelineAsPropertyLists[0];
            emailOne = dictOne[EMAIL];
            formattedRecipients = [NSString stringWithFormat:@"%@, %@, %@", _savedAttorney.email, _savedBondsmen.email, emailOne];
            textRecipientArray = @[_savedAttorney.phone, _savedBondsmen.phone, dictOne[PHONE_NO]];
        }
        
        else if([_lifelineAsPropertyLists count] == 2)
        {
            dictOne = _lifelineAsPropertyLists[0];
            emailOne = dictOne[EMAIL];
            dictTwo = _lifelineAsPropertyLists[1];
            emailTwo = dictTwo[EMAIL];
            formattedRecipients = [NSString stringWithFormat:@"%@, %@, %@, %@", _savedAttorney.email, _savedBondsmen.email, emailOne, emailTwo];
            textRecipientArray = @[_savedAttorney.phone, _savedBondsmen.phone, dictOne[PHONE_NO], dictTwo[PHONE_NO]];
        }
        
        else if([_lifelineAsPropertyLists count] == 3)
        {
            dictOne = _lifelineAsPropertyLists[0];
            emailOne = dictOne[EMAIL];
            dictTwo = _lifelineAsPropertyLists[1];
            emailTwo = dictTwo[EMAIL];
            dictThree = _lifelineAsPropertyLists[2];
            emailThree = dictThree[EMAIL];
            formattedRecipients = [NSString stringWithFormat:@"%@, %@, %@, %@, %@", _savedAttorney.email, _savedBondsmen.email, emailOne, emailTwo, emailThree];
            textRecipientArray = @[_savedAttorney.phone, _savedBondsmen.phone, dictOne[PHONE_NO], dictTwo[PHONE_NO], dictThree[PHONE_NO]];
        }
        
        else if([_lifelineAsPropertyLists count] == 4)
        {
            dictOne = _lifelineAsPropertyLists[0];
            emailOne = dictOne[EMAIL];
            dictTwo = _lifelineAsPropertyLists[1];
            emailTwo = dictTwo[EMAIL];
            dictThree = _lifelineAsPropertyLists[2];
            emailThree = dictThree[EMAIL];
            dictFour = _lifelineAsPropertyLists[3];
            emailFour = dictFour[EMAIL];
            formattedRecipients = [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@", _savedAttorney.email, _savedBondsmen.email, emailOne, emailTwo, emailThree, emailFour];
            textRecipientArray = @[_savedAttorney.phone, _savedBondsmen.phone, dictOne[PHONE_NO], dictTwo[PHONE_NO], dictThree[PHONE_NO], dictFour[PHONE_NO]];
        }
        
        else if([_lifelineAsPropertyLists count] == 5)
        {
            dictOne = _lifelineAsPropertyLists[0];
            emailOne = dictOne[EMAIL];
            dictTwo = _lifelineAsPropertyLists[1];
            emailTwo = dictTwo[EMAIL];
            dictThree = _lifelineAsPropertyLists[2];
            emailThree = dictThree[EMAIL];
            dictFour = _lifelineAsPropertyLists[3];
            emailFour = dictFour[EMAIL];
            dictFive = _lifelineAsPropertyLists[4];
            emailFive = dictFive[EMAIL];
            formattedRecipients = [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@, %@", _savedAttorney.email, _savedBondsmen.email, emailOne, emailTwo, emailThree, emailFour, emailFive];
            textRecipientArray = @[_savedAttorney.phone, _savedBondsmen.phone, dictOne[PHONE_NO], dictTwo[PHONE_NO], dictThree[PHONE_NO], dictFour[PHONE_NO], dictFive[PHONE_NO]];
        }
        mailgun = [Mailgun clientWithDomain:@"sandbox56d3af57c3ae4227a46762cf7f67d726.mailgun.org" apiKey:@"key-a84fe8abec64b12d0ca050406a95b4c1"];
        [mailgun sendMessageTo:formattedRecipients
                          from:_currentUser[@"email"]
                       subject:@"A Message from One Tyme"
                          body:emailBody];
        [self textAlertWithArray:textRecipientArray andText:emailBody];
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:@"You have sent a successful alert to your attorney, bail bondsman, and lifelines." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    
    else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must add a message, attorney, bail bondsman, and at least one lifeline to send an alert." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)changeText
{
    if(_currentCount == 0)
    {
        [self removeAlertView];
        [self sendMailgunEmail];
    }
    else
    {
        _alertLabel.text = [NSString stringWithFormat:@"%d",_currentCount];
        _currentCount = _currentCount - 1;
    }
}
- (void)removeAlertView
{
    [_timerAlert invalidate];
    _timerAlert = nil;
    
    [self.alertView removeFromSuperview];
    
}

-(void)failureAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                 message:@"Your device doesn't support the composer sheet"
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles: nil];
    [alert show];
}

-(void)successAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                    message:@"Your email has been successfully sent."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            [self successAlert];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            [self failureAlert];
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(Attorney *)attorneyObjectForDictionary:(NSDictionary *)dictionary
{
    Attorney *attorneyObject = [[Attorney alloc] initWithAttorney:dictionary];
    return attorneyObject;
}

-(BailBonds *)bailBondsObjectForDictionary:(NSDictionary *)dictionary
{
    BailBonds *bailBondsObject = [[BailBonds alloc] initWithBailBonds:dictionary];
    return bailBondsObject;
}

-(LifeLine *)lifelineObjectForDictionary:(NSDictionary *)dictionary
{
    LifeLine *lifelineObject = [[LifeLine alloc] initWithLifeLine:dictionary];
    return lifelineObject;
}

-(void)postToFacebook
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [self presentViewController:facebookSheet animated:YES completion:nil];
    }
    else if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        UIAlertView *facebookAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You cannot post to Facebook at this time" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [facebookAlert show];
    }
    
    
    else
    {
        UIAlertView *facebookAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You cannot post to Facebook at this time" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [facebookAlert show];
    }
    
}

-(void)shareText
{
    [self showSMS];
}

-(void)postToTwitter
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *twitterSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [self presentViewController:twitterSheet animated:YES completion:nil];
    }
    else if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        UIAlertView *facebookAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You cannot post to Twitter at this time" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [facebookAlert show];
    }
    
    
    else
    {
        UIAlertView *facebookAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You cannot post to Twitter at this time" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [facebookAlert show];
    }
    
}

-(void)shareByMail
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailerTwo = [[MFMailComposeViewController alloc] init];
        
        mailerTwo.mailComposeDelegate = self;
        
        [mailerTwo setSubject:@"Sharing OneTyme App"];
        [mailerTwo setMessageBody:@"Sharing OneTyme App:\nwww.onetyme.us" isHTML:NO];
        [self presentViewController:mailerTwo animated:YES completion:nil];
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

-(void)showAction
{
    NSString *actionSheetTitle = @"Menu Options"; //Action Sheet Title
    NSString *shareByEmail = @"Share via e-mail";
    NSString *shareByText = @"Share via text";
    NSString *facebook = @"Post to Facebook";
    NSString *twitter = @"Post to Twitter";
    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *menuActionSheet = [[UIActionSheet alloc]
                        initWithTitle:actionSheetTitle
                        delegate:self
                        cancelButtonTitle:cancelTitle
                        destructiveButtonTitle:shareByEmail
                                      otherButtonTitles:shareByText, facebook, twitter, nil];
    [menuActionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        [self shareByMail];
    }
    
    else if(buttonIndex == 1)
    {
        [self shareText];
    }
    
    else if(buttonIndex == 2)
    {
        [self postToFacebook];
    }
        
    else if(buttonIndex == 3)
    {
        [self postToTwitter];
    }
}

-(void)textAlertWithArray:(NSArray *)recipients andText:(NSString *)text
{
    for(int i = 0; i < [recipients count]; i++)
    {
        [PFCloud callFunctionInBackground:@"sendText" withParameters:@{@"to" : recipients[i], @"from" : @"+16788258982", @"body" : text} block:^(id object, NSError *error) {
            if(error == nil)
            {
                NSLog(@"Success");
            }
        }];
    }
}

- (void)showSMS{
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:nil];
    [messageController setBody:@"Sharing OneTyme App:\nwww.onetyme.us"];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [self setNeedsStatusBarAppearanceUpdate];
        [messageController setNeedsStatusBarAppearanceUpdate];
        
    }];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(CAGradientLayer *)makeBackgroundLayerForView:(UIView *)view
{
    CAGradientLayer *viewLayer = [CAGradientLayer layer];
    viewLayer.frame = view.bounds;
    viewLayer.colors = [NSArray arrayWithObjects:
                        (id)[[UIColor darkGrayColor] CGColor],
                        (id)[[UIColor darkGrayColor] CGColor],
                        nil];
    
    return viewLayer;
}

- (IBAction)shareOneTyme:(id)sender {
    [self showAction];
}

- (IBAction)addProfile:(id)sender {
    [self performSegueWithIdentifier:@"toProfile" sender:self];
}

- (IBAction)showInfoPage:(id)sender {
    [self performSegueWithIdentifier:@"toInformation" sender:self];
}

@end
