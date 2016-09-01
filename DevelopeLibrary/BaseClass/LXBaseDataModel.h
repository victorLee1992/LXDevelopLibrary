//
//  LXBaseDataModel.h
//  AccidentClaims
//
//  Created by victor on 16/8/5.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXBaseDataProtocol.h"

#define JsonStringData(data)     \
returnStringObjectWithResponseData(data)

@interface LXBaseDataModel : NSObject<LXDataSerializationDelegate,LXDataDeserilizationDelegate>


NSString* returnStringObjectWithResponseData(id respondeData);


@end




@interface LXListDataModel : NSObject<LXDataDeserilizationDelegate,LXDataSerializationDelegate>

@property(nonatomic,strong)NSMutableArray * items;


@end