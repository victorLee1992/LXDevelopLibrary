//
//  UIImage+colorDract.m
//  AccidentClaims
//
//  Created by victor on 16/7/26.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "UIImage+colorDract.h"

@implementation UIImage (colorDract)


+(UIImage *)crateImageWithColor:(UIColor *)color{
    
    UIImage * image;
    CGRect rect = CGRectMake(0, 0, 1.f, 1.f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
