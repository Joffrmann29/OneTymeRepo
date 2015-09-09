//
//  AttorneyBioViewController.m
//  onetyme
//
//  Created by Joffrey Mann on 8/31/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AttorneyBioViewController.h"
#import "Attorney.h"

@interface AttorneyBioViewController ()

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
@property (strong, nonatomic) NSURL *attorneyURL;

@end

@implementation AttorneyBioViewController

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
    
    _nameLabel.text = [NSString stringWithFormat:@"Name: %@", _attorney[@"Name"]];
    _addressLabel.text = [NSString stringWithFormat:@"Address: %@", _attorney[@"Address"]];
    _cityLabel.text = [NSString stringWithFormat:@"City: %@", _attorney[@"City"]];
    _stateLabel.text = [NSString stringWithFormat:@"State: %@", _attorney[@"State"]];
    _zipLabel.text = [NSString stringWithFormat:@"Zip: %@", _attorney[@"Zip"]];
    _phoneLabel.text = [NSString stringWithFormat:@"Phone: %@", _attorney[@"Phone"]];
    _secondaryLabel.text = [NSString stringWithFormat:@"Secondary Phone: %@", _attorney[@"SecondaryPhone"]];
    _emailLabel.text = [NSString stringWithFormat:@"E-mail: %@", _attorney[@"Email"]];
    
    PFFile *imgFile = _attorney[@"ProfilePic"];
    
    if(imgFile != nil)
    {
        NSData *imgData = [imgFile getData];
        _logoView.image = [UIImage imageWithData:imgData];
    }
    
    else
    {
        _logoView.image = [UIImage imageNamed:@"AttorneySelected.png"];
    }
    
    self.navigationItem.title = @"Attorney Bio";
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
