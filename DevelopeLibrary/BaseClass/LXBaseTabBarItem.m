//
//  LXBaseTabBarItem.m
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXBaseTabBarItem.h"

@implementation LXBaseTabBarItem

-(instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)index{
    
    self =[super initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    if (self) {
        
        self.tag0 = index;
        self.selectImage = selectedImage;
        self.normalImage = image;
    }
    return self;
    
}


-(void)setTag0:(NSInteger)tag0{
    _tag0 = tag0;
    
    self.tag = _tag0;
}



-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    
    [super setTitleTextAttributes:@{NSForegroundColorAttributeName:color} forState:state];
}


@end
