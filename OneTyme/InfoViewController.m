#import "InfoViewController.h"
#import "MBProgressHUD.h"

@interface InfoViewController ()

@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation InfoViewController

#pragma mark
#pragma mark - View load methods

- (void)viewDidLoad
{
    [self loadWebsite];
    _infoWebView.delegate = self;
    [super viewDidLoad];
}

-(void)loadingOverlay
{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading Information";
}

-(void)loadWebsite
{
    NSString *bailPath = @"http://www.onetyme.us/information-page";
    //append the country name to the wiki path
    
    //create a URL object
    NSURL *url = [NSURL URLWithString:bailPath];
    //create a url request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //load the request in webview
    [_infoWebView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self loadingOverlay];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_hud hide:YES];
}

#pragma mark -
#pragma mark -  Button click methods

-(IBAction)backButton_Clicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark
#pragma mark - View extra methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end