//
//  LXDataBaseQueue.h
//  MyDataBaseDemo
//
//  Created by victor on 16/8/22.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "FMDatabaseQueue.h"

@interface LXDataBaseQueue : FMDatabaseQueue

@property(nonatomic,strong)dispatch_queue_t myQ;

@property(nonatomic,strong)FMDatabase * myDB;

@end
