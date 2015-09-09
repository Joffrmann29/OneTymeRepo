//
//  BailBondsDetailViewController.m
//  onetyme
//
//  Created by Joffrey Mann on 4/13/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "BailBondsDetailViewController.h"
#import "BackgroundLayer.h"
#import "MBProgressHUD.h"
#import "BailBonds.h"

@interface BailBondsDetailViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) MBProgressHUD *hud;

@property (strong, nonatomic) NSURL *bondsURL;

@end

@implementation BailBondsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView.delegate = self;
    [self loadWebsite];
    [self loadingOverlay];
}

-(void)loadingOverlay
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading Bail Bonds Details";
}

-(void)loadWebsite
{
    NSString *bailPath = _bondsmen[@"url"];
    //append the country name to the wiki path
    
    //create a URL object
    NSURL *url = [NSURL URLWithString:bailPath];
    //create a url request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //load the request in webview
    [_webView loadRequest:request];
}

//-(void)webViewDidStartLoad:(UIWebView *)webView
//{
//}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_hud hide:YES];
}

-(UIImage *)resizeImage:(UIImage *)image
{
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *transformedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(transformedImage);
    UIImage *finalImage = [UIImage imageWithData:imgData];
    
    return finalImage;
}

- (IBAction)addAsYourBondsmen:(id)sender
{
    [self writeBondsmenToFilesystem:[self bondsmenWithValues]];
    
    NSString *messageString = [NSString stringWithFormat:@"%@ has been saved as your personal bail bondsmen.", _bondsmen[@"Name"]];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Success" message:messageString  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
}

-(void)writeBondsmenToFilesystem:(BailBonds *)bondsmen
{
    NSArray *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    self.bondsURL = [[urls lastObject] URLByAppendingPathComponent:@"bonds.data"];
    
    NSData *data = [NSData dataWithContentsOfURL:self.bondsURL];
    NSMutableArray *mBondsmen = [[NSMutableArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    [mBondsmen insertObject:bondsmen atIndex:0];
    NSData *fileData = [NSKeyedArchiver archivedDataWithRootObject:mBondsmen];
    [fileData writeToURL:self.bondsURL atomically:YES];
}

-(BailBonds *)bondsmenWithValues
{
    BailBonds *bondsmenToSave = [[BailBonds alloc]init];
    bondsmenToSave.name = _bondsmen[@"Name"];
    bondsmenToSave.address = _bondsmen[@"Address"];
    bondsmenToSave.city = _bondsmen[@"City"];
    bondsmenToSave.state = _bondsmen[@"State"];
    bondsmenToSave.zipCode = _bondsmen[@"Zip"];
    bondsmenToSave.phone = _bondsmen[@"Phone"];
    bondsmenToSave.secondaryPhone = _bondsmen[@"SecondaryPhone"];
    bondsmenToSave.email = _bondsmen[@"Email"];
    
    return bondsmenToSave;
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

@end
