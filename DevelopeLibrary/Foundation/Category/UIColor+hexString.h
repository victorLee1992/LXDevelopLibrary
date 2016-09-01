//
//  UIColor+hexString.h
//  NationalWealth
//
//  Created by victor on 15/10/14.
//  Copyright © 2015年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexString)

+ (UIColor *) colorWithHexString: (NSString *)color;


+ (UIColor *) colorWithHexString: (NSString *)color andAlpha:(CGFloat)alpha;
@end
