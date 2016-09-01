//
//  LXCustomTabBarItem.m
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXCustomTabBarItem.h"

@implementation LXCustomTabBarItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)setNormalImage:(UIImage *)normalImage andSelectedImage:(UIImage *)selectedImage{
    
    _normalImage = normalImage;
    _selectedImage = selectedImage;
    
    [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
}

-(void)setIsSelected:(BOOL)isSelected{
    
    _isSelected = isSelected;
    if (_isSelected) {
        [self setBackgroundImage:_selectedImage forState:UIControlStateNormal];
    }
    else{
        [self setBackgroundImage:_normalImage forState:UIControlStateNormal];
    }
}

@end
