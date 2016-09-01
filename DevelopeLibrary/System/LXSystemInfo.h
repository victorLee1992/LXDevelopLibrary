//
//  LXSystemInfo.h
//  CPLCountryFair
//
//  Created by victor on 16/6/23.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+hexString.h"

@interface LXSystemInfo : NSObject


#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

#define Screen_size     [[UIScreen mainScreen] bounds].size
#define NavigationBar_height  64.0f
#define TabBarItem_height     49.0f

//屏幕具体尺寸
#define IS_SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_47_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_55_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)



#define IOS8_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS9_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )

#define RGB_A(r,g,b,a)       [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)           RGB_A(r,g,b,1.0f)
#define HexingColor_A(x,a)   [UIColor colorWithHexString:x andAlpha:a]
#define HexingColor(x)       [UIColor colorWithHexString:x]

+(NSString*)appVersion;

+(NSString*)appIdentifier;


#define displayScale (nativeScale()/2)
#define fontScale    ((ceil(displayScale)-1)*2)
CGFloat nativeScale(void);

@end
