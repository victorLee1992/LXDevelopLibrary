//
//  LXDataBaseQueue.m
//  MyDataBaseDemo
//
//  Created by victor on 16/8/22.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXDataBaseQueue.h"

@implementation LXDataBaseQueue

-(dispatch_queue_t)myQ{
    
    return _queue;
}


-(FMDatabase *)myDB{
    
    return _db;
}

@end
