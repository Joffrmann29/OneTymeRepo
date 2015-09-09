//
//  BailBondsBioViewController.m
//  onetyme
//
//  Created by Joffrey Mann on 8/31/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "BailBondsBioViewController.h"
#import "BailBonds.h"

@interface BailBondsBioViewController ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UILabel *zipLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UIImageView *logoView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong, nonatomic) NSURL *bondsURL;

@end

@implementation BailBondsBioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAGradientLayer *viewLayer = [self makeBackgroundLayerForView:self.view];
    
    UIGraphicsBeginImageContext(viewLayer.bounds.size);
    [viewLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (backgroundImage != nil)
    {
        _backgroundView.image = backgroundImage;
    }
    
    _nameLabel.text = [NSString stringWithFormat:@"Name: %@", _bondsmen[@"Name"]];
    _addressLabel.text = [NSString stringWithFormat:@"Address: %@", _bondsmen[@"Address"]];
    _cityLabel.text = [NSString stringWithFormat:@"City: %@", _bondsmen[@"City"]];
    _stateLabel.text = [NSString stringWithFormat:@"State: %@", _bondsmen[@"State"]];
    _zipLabel.text = [NSString stringWithFormat:@"Zip: %@", _bondsmen[@"Zip"]];
    _phoneLabel.text = [NSString stringWithFormat:@"Phone: %@", _bondsmen[@"Phone"]];
    _secondaryLabel.text = [NSString stringWithFormat:@"Secondary Phone: %@", _bondsmen[@"SecondaryPhone"]];
    _emailLabel.text = [NSString stringWithFormat:@"E-mail: %@", _bondsmen[@"Email"]];
    
    PFFile *imgFile = _bondsmen[@"Logo"];
    
    if(imgFile)
    {
        NSData *imgData = [imgFile getData];
        _logoView.image = [UIImage imageWithData:imgData];
    }
    
    else
    {
        _logoView.image = [UIImage imageNamed:@"AttorneySelected.png"];
    }
    
    self.navigationItem.title = @"Bondsmen Bio";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CAGradientLayer *)makeBackgroundLayerForView:(UIView *)view
{
    CAGradientLayer *viewLayer = [CAGradientLayer layer];
    viewLayer.frame = view.bounds;
    viewLayer.colors = [NSArray arrayWithObjects:
                        (id)[[UIColor lightGrayColor] CGColor],
                        (id)[[UIColor grayColor] CGColor],
                        nil];
    
    return viewLayer;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
