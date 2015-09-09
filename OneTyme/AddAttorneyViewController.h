//
//  AddAttorneyViewController.h
//  onetyme
//
//  Created by Joffrey Mann on 8/7/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddAttorneyDelegate <NSObject>

-(void)saveAttorneyWithDict:(NSDictionary *)dict;
-(void)checkEditing:(BOOL)editing;

@end

@interface AddAttorneyViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UITextField *cityField;
@property (strong, nonatomic) IBOutlet UITextField *stateField;
@property (strong, nonatomic) IBOutlet UITextField *zipField;
@property (strong, nonatomic) IBOutlet UITextField *phoneField;
@property (strong, nonatomic) IBOutlet UITextField *secondaryPhoneField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;

@property (nonatomic) BOOL editing;

@property (weak, nonatomic) id <AddAttorneyDelegate> delegate;

- (IBAction)saveButtonPressed:(id)sender;
@end