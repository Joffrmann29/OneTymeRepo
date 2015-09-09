//
//  AttorneyDetailViewController.m
//  onetyme
//
//  Created by Joffrey Mann on 4/13/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AttorneyDetailViewController.h"
#import "BackgroundLayer.h"
#import "MBProgressHUD.h"
#import "Attorney.h"

@interface AttorneyDetailViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) MBProgressHUD *hud;

@property (strong, nonatomic) NSURL *attorneyURL;

@end

@implementation AttorneyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView.delegate = self;
    [self loadWebsite];
}

-(void)loadingOverlay
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading Attorney Details";
}

-(void)loadWebsite
{
    NSString *lawyerPath = _attorney[@"url"];
    //append the country name to the wiki path
    
    //create a URL object
    NSURL *url = [NSURL URLWithString:lawyerPath];
    //create a url request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //load the request in webview
    [_webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self loadingOverlay];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_hud hide:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAsYourAttorney:(id)sender
{
    [self writeAttorneyToFilesystem:[self attorneyWithValues]];
    
    NSString *messageString = [NSString stringWithFormat:@"%@ has been saved as your personal attorney.", _attorney[@"Name"]];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:messageString  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
}

-(void)writeAttorneyToFilesystem:(Attorney *)attorney
{
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    self.attorneyURL = [[urls lastObject] URLByAppendingPathComponent:@"attorney.data"];
    
    NSData *data = [NSData dataWithContentsOfURL:self.attorneyURL];
    NSMutableArray *mAttorneys = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    [mAttorneys insertObject:attorney atIndex:0];
    NSData *fileData = [NSKeyedArchiver archivedDataWithRootObject:mAttorneys];
    [fileData writeToURL:self.attorneyURL atomically:YES];
}

-(Attorney *)attorneyWithValues
{
    Attorney *attorneyToSave = [[Attorney alloc]init];
    attorneyToSave.name = _attorney[@"Name"];
    attorneyToSave.address = _attorney[@"Address"];
    attorneyToSave.city = _attorney[@"City"];
    attorneyToSave.state = _attorney[@"State"];
    attorneyToSave.zipCode = _attorney[@"Zip"];
    attorneyToSave.phone = _attorney[@"Phone"];
    attorneyToSave.secondaryPhone = _attorney[@"SecondaryPhone"];
    attorneyToSave.email = _attorney[@"Email"];
    
    return attorneyToSave;
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
