//
//  LXBaseDataProtocol.h
//  AccidentClaims
//
//  Created by victor on 16/8/5.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#ifndef LXBaseDataProtocol_h
#define LXBaseDataProtocol_h


@protocol LXDataSerializationDelegate <NSObject>

@optional

-(instancetype)initWithDictionary:(NSDictionary*)dict;

-(instancetype)initWithArray:(NSArray*)array;


@end



@protocol LXDataDeserilizationDelegate <NSObject>

@optional

-(NSDictionary*)dictionaryValue;

-(NSArray*)arrayValue;

@end

#endif /* LXBaseDataProtocol_h */
