//
//  FirstViewController.h
//  DPToDoList
//
//  Created by Student P_06 on 03/10/16.
//  Copyright © 2016 Divya Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPDatabaseManager.h"

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *allTask;
}


@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end

