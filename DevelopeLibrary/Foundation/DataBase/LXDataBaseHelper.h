//
//  LXDataBaseHelper.h
//  MyDataBaseDemo
//
//  Created by victor on 16/8/22.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase;
@class LXDataBaseQueue;
@class FMResultSet;
#import "LXDataBaseObjectProtocol.h"


typedef void(^writeBlock)(BOOL finished);
typedef void(^readBlock)(NSArray* object);

typedef NS_ENUM(NSInteger, LXUpdateType) {
    LXUpdateTypeAdd =0, //操作数据库的类型
    LXUpdateTypeModify,
    LXUpdateTypeDelete
};


@interface LXDataBaseHelper : NSObject


@property(nonatomic,strong)LXDataBaseQueue * dataBaseQueue;
@property(nonatomic,strong)NSString * dataBasePath;


+(LXDataBaseHelper*)shareInstance;

// 获取databaseQueue
+(LXDataBaseQueue*)mainDataBaseQueue;

// 获取database
+(FMDatabase*)getCurrentDataBase;


+(void)createDataBaseWithPath:(NSString*)path;

+(void)creatTable:(Class)tableNameClass and:(void (^)(BOOL finished))block;

+(void)updateData:(id <LXDataBaseObjectDelegate>)tableDataModel updateType:(LXUpdateType)type and:(writeBlock)block;

// 获取的是  该表中的 所有的记录，以数组返回，类型为 NSArray<tableNameClass *>
+(void)readData:(Class)tableNameClass and:(readBlock)block;

// 自定义sql 进行查询 ，返回类型FMResultSet
+(void)readResultSet:(NSString*)statement and:(void(^)(FMResultSet * rs))block;


NSString* translateObjcClass(Class propertyClass);

NSArray * getPropertyList(Class tableNameClass);

@end
