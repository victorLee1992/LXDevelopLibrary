//
//  LXDataBaseObjectProtocol.h
//  MyDataBaseDemo
//
//  Created by victor on 16/8/24.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#ifndef LXDataBaseObjectProtocol_h
#define LXDataBaseObjectProtocol_h


@protocol LXDataBaseObjectDelegate <NSObject>


// 如果有 主键，需要属性名需以 “key_” 作为前缀
//NSString* tableNameForBind(Class class);

@required
+(NSString *)tableNameForBind;

@optional
-(id)valueForKey:(NSString*)key;

@end



#endif /* LXDataBaseObjectProtocol_h */
