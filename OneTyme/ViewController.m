//
//  ViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/27/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *oneTymeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rsz_bghomenonretina.png"]];
    oneTymeImage.frame = CGRectMake(0, 0, self.view.frame.size.width, 1107);
    [self.view addSubview:oneTymeImage];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    CGRect tabBounds = CGRectMake(0, 0, 415, 44);
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
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareButton.frame = CGRectMake(70.5, 450, 273, 49);
    [shareButton setBackgroundImage:[UIImage imageNamed:@"Share.png"] forState:UIControlStateNormal];
    [self.view addSubview:shareButton];
    
    UIButton *addProfileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addProfileButton.frame = CGRectMake(70.5, 519, 273, 49);
    [addProfileButton setBackgroundImage:[UIImage imageNamed:@"AddProfile.png"] forState:UIControlStateNormal];
    [self.view addSubview:addProfileButton];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    infoButton.frame = CGRectMake(70.5, 588, 273, 49);
    [infoButton setBackgroundImage:[UIImage imageNamed:@"Information.png"] forState:UIControlStateNormal];
    [self.view addSubview:infoButton];
    
    self.tabBarController.tabBar.opaque = NO;
    
    NSArray *items = self.tabBarController.tabBar.items;
    
    for (UITabBarItem *tbi in items) {
        UIImage *image = tbi.image;
        tbi.selectedImage = image;
        tbi.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    NSLog(@"%f", self.view.frame.size.width);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
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

@end
