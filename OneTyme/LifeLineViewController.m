//
//  LifeLineViewController.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "LifeLineViewController.h"
#import "AppDelegate.h"
#import "LifeLineTableViewCell.h"
#import "LifeLine.h"
#import "LifelineAddViewController.h"

<<<<<<< HEAD
@interface LifeLineViewController ()<LifelineAddViewControllerDelegate>

@property (strong, nonatomic) AppDelegate *appDelegate;
@property (nonatomic) BOOL editingMode;

=======
@interface LifeLineViewController ()<UITableViewDelegate,UITableViewDataSource,LifelineAddViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AppDelegate *appDelegate;
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
@end

@implementation LifeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
<<<<<<< HEAD
    self.editingMode = NO;
    
=======
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    /* Access NSUserDefaults for the array containing the task's saved as NSDictionary objects. */
    NSArray *lifelinesAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:LIFELINE_OBJECTS_KEY];
    
    /* Iterate over the returned array with fast enumeration. Convert each dictionary into a FitnessGoal object using the helper method goalObjectForDictionary. Add the returned goal objects to the goalObjectsArray */
    for (NSDictionary *dictionary in lifelinesAsPropertyLists){
        LifeLine *lifelineObject = [self lifelineObjectForDictionary:dictionary];
            [_appDelegate.LifeLineDataArray addObject:lifelineObject];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_appDelegate.LifeLineDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LifeLineTableViewCell";
    
    LifeLineTableViewCell *cell = (LifeLineTableViewCell *) [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        
//        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LifeLineTableViewCell" owner:self options:nil];
//        
//        for (id currentObject in topLevelObjects)
//        {
//            if ([currentObject isKindOfClass:[UITableViewCell class]])
//            {
//                cell =  (LifeLineTableViewCell *) currentObject;
//                break;
//            }
//        }
//    }
    
   LifeLine *lifeline = [_appDelegate.LifeLineDataArray objectAtIndex:indexPath.row];
    
    
    cell.nameLabel.text = lifeline.name;
    cell.addressLabel.text = lifeline.address;
    cell.zipLabel.text = [NSString stringWithFormat:@"%@, %@ %@", lifeline.city, lifeline.state, lifeline.zipCode];
    
<<<<<<< HEAD
    cell.nameLabel.font = [UIFont fontWithName:@"Times New Roman" size:17];
    cell.addressLabel.font = [UIFont fontWithName:@"Times New Roman" size:17];
    cell.zipLabel.font = [UIFont fontWithName:@"Times New Roman" size:17];
    
    return cell;
}

/* Allow the user to edit tableViewCells for deletion */
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/* Method called when the users swipes and presses the delete key */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [_appDelegate.LifeLineDataArray removeObjectAtIndex:indexPath.row];
    }
    /* With the updated array of task objects iterate over them and convert them to plists. Save the plists in the newTaskObjectsData NSMutableArray. Save this array to NSUserDefaults. */
    NSMutableArray *newLifelineObjectsData = [[NSMutableArray alloc] init];
    
    for (LifeLine *lifeline in _appDelegate.LifeLineDataArray){
        [newLifelineObjectsData addObject:[self lifelineObjectsAsAPropertyList:lifeline]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:newLifelineObjectsData forKey:LIFELINE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    /* Animate the deletion of the cell */
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

=======
    return cell;
}

>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

<<<<<<< HEAD
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toEditLifeline" sender:indexPath];
}

=======
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
-(void)didAddLifeline:(LifeLine *)lifeline
{
    [_appDelegate.LifeLineDataArray addObject:lifeline];
    
    /* Use NSUserDefaults to access all previously saved tasks. If there were not saved tasks we allocate and initialize the NSMutableArray named taskObjectsAsPropertyLists. */
    NSMutableArray *lifelineObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:LIFELINE_OBJECTS_KEY] mutableCopy];
    if (!lifelineObjectsAsPropertyLists) lifelineObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    /* First convert the task object to a property list using the method taskObjectAsAPropertyList. Then add the propertylist (dictionary) to the taskObjectsAsPropertyLists NSMutableArray. Synchronize will save the added array to NSUserDefaults.*/
    [lifelineObjectsAsPropertyLists addObject:[self lifelineObjectsAsAPropertyList:lifeline]];
    [[NSUserDefaults standardUserDefaults] setObject:lifelineObjectsAsPropertyLists forKey:LIFELINE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
}

<<<<<<< HEAD

-(void)didUpdateLifeline:(LifeLine *)lifeline
{
    [self.tableView reloadData];
    [self saveLifelines];
}

-(void)saveLifelines
{
    /* Create a NSMutableArray that we will NSDictionaries returned from the method taskObjectAsAPropertyList. */
    NSMutableArray *lifelineObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    for (int x = 0; x < [_appDelegate.LifeLineDataArray count]; x ++){
                [lifelineObjectsAsPropertyLists addObject:[self lifelineObjectsAsAPropertyList:_appDelegate.LifeLineDataArray[x]]];
    }
    
    /* Save the updated array to NSUserDefaults. */
    [[NSUserDefaults standardUserDefaults] setObject:lifelineObjectsAsPropertyLists forKey:LIFELINE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

=======
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
#pragma mark - Helper Methods

/* Convert and return an NSDictionary of the taskObject */
-(NSDictionary *)lifelineObjectsAsAPropertyList:(LifeLine *)lifelineObject
{
<<<<<<< HEAD
    NSDictionary *dictionary = @{NAME : lifelineObject.name, ADDRESS : lifelineObject.address, CITY : lifelineObject.city, STATE : lifelineObject.state, ZIP_CODE : lifelineObject.zipCode, PHONE_NO : lifelineObject.phone, EMAIL : lifelineObject.email };
=======
    NSDictionary *dictionary = @{NAME : lifelineObject.name, ADDRESS : lifelineObject.address, CITY : lifelineObject.city, STATE : lifelineObject.state, ZIP_CODE : lifelineObject.zipCode, PHONE_NO : lifelineObject.phone, SECONDARY_PHONE_NO : lifelineObject.secondaryPhone, EMAIL : lifelineObject.email };
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
    return dictionary;
}


-(LifeLine *)lifelineObjectForDictionary:(NSDictionary *)dictionary
{
    LifeLine *lifelineObject = [[LifeLine alloc] initWithLifeLine:dictionary];
    return lifelineObject;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    LifeLine *lifelineObject = [[LifeLine alloc]init];
    /* Before transitioning to the CCAddTaskViewController set the delegate property to self. This way the CCAddTaskViewController will be able to call methods in the ViewController file. */
    if ([segue.destinationViewController isKindOfClass:[LifelineAddViewController class]]){
<<<<<<< HEAD
        if([[segue identifier] isEqualToString:@"toEditLifeline"]){
        LifelineAddViewController *addViewController = segue.destinationViewController;
        NSIndexPath *path = sender;
        lifelineObject = _appDelegate.LifeLineDataArray[path.row];
        addViewController.delegate = self;
        _editingMode = YES;
        addViewController.isEdit = _editingMode;
        addViewController.lifeline = lifelineObject;
        }
=======
        LifelineAddViewController *addViewController = segue.destinationViewController;
        addViewController.delegate = self;
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
    }
}


- (IBAction)addLifeline:(id)sender {
<<<<<<< HEAD
//    [self performSegueWithIdentifier:@"toAddLifeline" sender:self];
=======
    [self performSegueWithIdentifier:@"toAddLifeline" sender:self];
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
}
@end
