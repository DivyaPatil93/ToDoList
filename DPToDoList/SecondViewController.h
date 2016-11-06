//
//  SecondViewController.h
//  DPToDoList
//
//  Created by Student P_06 on 03/10/16.
//  Copyright © 2016 Divya Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPDatabaseManager.h"

@interface SecondViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *myTextField;

@property (strong, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)saveButtonAction:(id)sender;
@end

