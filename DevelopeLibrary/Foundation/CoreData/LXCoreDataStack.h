//
//  LXCoreDataStack.h
//  LXDevelopLibrary
//
//  Created by victor on 16/5/31.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LXCoreDataStack : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



+(LXCoreDataStack*)defaultStack;

+(NSManagedObjectContext*)managedObjectContext;

+(NSManagedObjectModel*)managedObjectModel;

+(NSPersistentStoreCoordinator*)persistentStoreCoordinator;

@end
