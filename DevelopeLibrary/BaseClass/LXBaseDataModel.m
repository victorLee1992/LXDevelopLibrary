//
//  LXBaseDataModel.m
//  AccidentClaims
//
//  Created by victor on 16/8/5.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXBaseDataModel.h"

@interface LXBaseDataModel ()


@end

@implementation LXBaseDataModel


NSString* returnStringObjectWithResponseData(id respondeData){
    NSString * value ;
    if ([respondeData isKindOfClass:[NSString class]]) {
        value = respondeData;
    }
    else if ([respondeData isKindOfClass:[NSNumber class]]){
        value = ((NSNumber*)respondeData).stringValue;
    }
    else if (respondeData ==nil || respondeData == [NSNull null]){
        value = nil;
    }
    return value;
}


@end





@implementation LXListDataModel


-(NSMutableArray *)items{
    
    if (_items ==nil) {
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}

@end

