//
//  LXDataBaseHelper.m
//  MyDataBaseDemo
//
//  Created by victor on 16/8/22.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXDataBaseHelper.h"
#import "LXDataBaseQueue.h"
#import <FMDB.h>
#import <objc/runtime.h>


@interface LXDataBaseHelper ()

@end


@implementation LXDataBaseHelper


+(LXDataBaseHelper*)shareInstance{
    
    static LXDataBaseHelper * helper ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        helper = [[LXDataBaseHelper alloc]init];
    });
    return helper;
}


+(LXDataBaseQueue *)mainDataBaseQueue{
    
    return [self shareInstance].dataBaseQueue;
}


+(void)createDataBaseWithPath:(NSString *)path{
    
    [self shareInstance].dataBasePath = path;
    [self shareInstance].dataBaseQueue = [LXDataBaseQueue databaseQueueWithPath:path];
}

+(void)creatTable:(Class)tableNameClass and:(void (^)(BOOL))block{
    
    if (![self mainDataBaseQueue]) {
        return;
    }
    if (!class_conformsToProtocol(tableNameClass, @protocol(LXDataBaseObjectDelegate))) {
        return;
    }
    
    NSString * tableName = [tableNameClass tableNameForBind];
    
    NSMutableString * tableContrsuct = [[NSMutableString alloc]initWithString:@""];
    for (NSString * varName in getPropertyList(tableNameClass)) {
        
        if ([varName hasPrefix:@"_key_"]) {
            
            [tableContrsuct appendFormat:[varName isEqualToString:[getPropertyList(tableNameClass) lastObject]]? @"%@ %@ PRIMARY KEY":@"%@ %@ PRIMARY KEY ,",varName,translateObjcClass(tableNameClass)];
        }
        else{
            [tableContrsuct appendFormat:[varName isEqualToString:[getPropertyList(tableNameClass) lastObject]]?@"%@ %@":@"%@ %@,",varName,translateObjcClass(tableNameClass)];
        }
    }
    
    NSString * sql = [NSString stringWithFormat:@"create table if not exists %@ (%@)",tableName,tableContrsuct];
    
    [[self mainDataBaseQueue] inDatabase:^(FMDatabase *db) {
        
        BOOL rs = [db executeUpdate:sql];
        if (rs) {
            NSLog(@"the database path is:%@",[self shareInstance].dataBasePath);
        }
        block(rs);
    }];
    
    
}

+(FMDatabase *)getCurrentDataBase{
    
    return [self mainDataBaseQueue].myDB;
}

+(void)updateData:(id<LXDataBaseObjectDelegate>)tableDataModel updateType:(LXUpdateType)type and:(writeBlock)block{
    
    if (![tableDataModel conformsToProtocol:@protocol(LXDataBaseObjectDelegate)]) {
        return;
    } ;
    
    NSString * tableName = [[tableDataModel class] tableNameForBind];
    
    [[self mainDataBaseQueue] inDatabase:^(FMDatabase *db) {
       // 先判断此表是否存在
        
        /*  这个方法的返回，不管该表是否存在， 最终得出的结果是“count(*) =0 ”，应该是 fmdb的bug
        FMResultSet *exixst = [db executeQuery:[NSString stringWithFormat:@"select count(*) from sqlite_master where type = 'table' and name = '%@' ",tableName]];
        if (![exixst next]|| [exixst._columnNameToIndexMap objectForKey:@"count(*)"].integerValue==0 ) {
            NSAssert(NO, @"this table is not exists!");
        }
        */
        FMResultSet * rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@",tableName]];
        NSString * sql =nil;

        switch (type) {
            case LXUpdateTypeAdd:
                
                sql = [self createAddActionSql:tableDataModel];
                break;
            case LXUpdateTypeModify:
                
                if (![rs next]) { // 没有记录，操作位为添加
                    sql = [self createAddActionSql:tableDataModel];
                }
                else{
                    sql = [self createModifyActionSql:tableDataModel];
                }
                break;
            case LXUpdateTypeDelete:
                
                if (![rs next]) {
                    return ;
                }
                else{
                    sql = [self createDeleteActionSql:tableDataModel];
                }
                break;
            default:// 如果没有类型 ，默认是 添加
                sql = [self createDeleteActionSql:tableDataModel];
                break;
        }
        
        BOOL result = [db executeUpdate:sql];
        block(result);
    }];
    
}

+(NSString*)createAddActionSql:(id)dataModel{
    NSString * sql = nil;
    Class dataModelClass = [dataModel class];
    NSMutableString * columsStr = [[NSMutableString alloc]initWithString:@""];
    NSMutableString * valuesStr = [[NSMutableString alloc]initWithString:@""];
    
    for (NSString * varName in getPropertyList(dataModelClass)) {
        [columsStr appendFormat:[varName isEqualToString:[getPropertyList(dataModelClass) lastObject]]?@"%@" :@"%@,",varName];
        [valuesStr appendFormat:[varName isEqualToString:[getPropertyList(dataModelClass) lastObject]]?@"'%@'" :@"'%@',",[dataModel valueForKey:[varName substringFromIndex:1]]];
    }
    
    sql = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",[dataModelClass tableNameForBind],columsStr,valuesStr];
    
    return sql;
}

+(NSString*)createModifyActionSql:(id)dataModel{
    NSString * sql = nil;
    Class dataModelClass = [dataModel class];
    NSMutableString * updateStr =[[NSMutableString alloc]initWithString:@""];
    
    for (NSString * varName in getPropertyList(dataModelClass)) {
        if ([varName isEqualToString:getKeyPrimary(dataModelClass)]) {
            continue;
        }
        else{
            [updateStr appendFormat:[varName isEqualToString:[getPropertyList(dataModelClass) lastObject]]?@"%@ = '%@'" :@"%@ = '%@' ,",varName,[dataModel valueForKey:[varName substringFromIndex:1]]];
        }
    }
    sql = [NSString stringWithFormat:@"update %@ set %@  where %@ = '%@'",[dataModelClass tableNameForBind], updateStr , getKeyPrimary(dataModelClass), [dataModel valueForKey:[getKeyPrimary(dataModelClass) substringFromIndex:1 ]]];
    
    return sql;
}

+(NSString*)createDeleteActionSql:(id)dataModel{
    Class dataModelClass = [dataModel class];
    NSString * sql = [NSString stringWithFormat:@"delete from %@ where %@ = '%@'", [dataModelClass tableNameForBind] , getKeyPrimary(dataModelClass), [dataModel valueForKey:[getKeyPrimary(dataModelClass) substringFromIndex:1]]];
    return sql;
}



+(void)readData:(Class)tableNameClass and:(readBlock)block{
    
    if (!class_conformsToProtocol(tableNameClass, @protocol(LXDataBaseObjectDelegate))) {
        return;
    }
    NSString * tableName = [tableNameClass tableNameForBind];
    
    [[self mainDataBaseQueue] inDatabase:^(FMDatabase *db) {
       
        FMResultSet * rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@",tableName] ];
        
        NSMutableArray * resultArr = [NSMutableArray array];
        while ([rs next]) {
            
            id data = [tableNameClass new];
            for (NSString * varName in getPropertyList(tableNameClass)) {
                [data setValue:[rs objectForColumnName:varName] forKey:[varName substringFromIndex:1]];
            }
            [resultArr addObject:data];
        }
        block(resultArr);
    }];
    
}

+(void)readResultSet:(NSString *)statement and:(void (^)(FMResultSet *))block{
    
    [[self mainDataBaseQueue]inDatabase:^(FMDatabase *db) {
        
        FMResultSet * rs = [db executeQuery:statement];
        if ([rs next]) {
            
            block(rs);
        }
        [rs close];
    }];
    
}

NSArray * getPropertyList(Class tableNameClass){
    
    unsigned int count;
    Ivar * ivars = class_copyIvarList(tableNameClass, &count);
    NSMutableArray * list = [NSMutableArray array];
    for (int i =0; i< count; i++) {
        
        Ivar ivar = ivars[i];
        const char * varName = ivar_getName(ivar);
        NSString * varNameStr = [NSString stringWithCString:varName encoding:NSUTF8StringEncoding];
        [list addObject:varNameStr];
    }
    return list;
}

NSString * getKeyPrimary(Class tableNameClass){
    
    NSString * key =nil;
    for (NSString * ivar in getPropertyList(tableNameClass)) {
        
        if ([ivar hasPrefix:@"_key_"]) {
            key = ivar;
            break;
        }
        else{
            continue;
        }
    }
    return key;
}

NSString* translateObjcClass(Class propertyClass){
    
    NSString * type =nil;
    if (propertyClass == [NSString class]) {
        type = @"TEXT";
    }
    else {
        type = @"AFFINITY";
    }
    return type;
    
}


@end
