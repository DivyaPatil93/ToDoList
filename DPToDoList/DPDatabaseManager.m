//
//  DPDatabaseManager.m
//  DPToDoList
//
//  Created by Student P_08 on 15/10/16.
//  Copyright © 2016 Divya Patil. All rights reserved.
//

#import "DPDatabaseManager.h"

@implementation DPDatabaseManager

+(instancetype)sharedManager {
    
    static DPDatabaseManager *sharedInstance;
    
    if(sharedInstance == nil) {
        
        sharedInstance = [[DPDatabaseManager alloc]init];
    }
    return sharedInstance;
}
-(NSString *)getDatabasePath {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DPDatabase.sqlite"];
}
-(int)executeQuery:(NSString *)query {
    
    int success = 0;
    
    const char *UTFquery = [query UTF8String];
    
    const char *UTFDatabasePath= [[self getDatabasePath]UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(UTFDatabasePath,&myDB)== SQLITE_OK) {
        
        if(sqlite3_prepare_v2(myDB,UTFquery,-1,&statement,NULL) == SQLITE_OK) {
            
            if(sqlite3_step(statement) == SQLITE_DONE) {
                
                success = 1;
            }
        }
    }
    
        sqlite3_close(myDB);
    return success;
}
-(NSMutableArray *)getAllTask {
    
    NSMutableArray *myArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT TASK FROM Task_Table";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    
    if(sqlite3_open(UTFDatabasePath,&myDB) == SQLITE_OK) {
        
        if(sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char *taskString = (const char *)sqlite3_column_text(statement, 0);
                
                NSString *task = [NSString stringWithUTF8String:taskString];
                
                [myArray addObject:task];
            }
        }
        else {
            NSLog(@"%s",sqlite3_errmsg(myDB));
        }
        sqlite3_close(myDB);
    }
    else {
        NSLog(@"%s",sqlite3_errmsg(myDB));
    }
    return myArray;
}

@end
