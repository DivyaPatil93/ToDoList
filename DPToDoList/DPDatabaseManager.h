//
//  DPDatabaseManager.h
//  DPToDoList
//
//  Created by Student P_08 on 15/10/16.
//  Copyright © 2016 Divya Patil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DPDatabaseManager : NSObject
{
    sqlite3 *myDB;
}
+(instancetype)sharedManager;

-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTask;

@end
