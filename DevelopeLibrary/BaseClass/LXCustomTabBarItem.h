//
//  LXCustomTabBarItem.h
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXCustomTabBarItem : UIButton

@property(nonatomic,strong)UIImage * selectedImage;
@property(nonatomic,strong)UIImage * normalImage;

@property(nonatomic,assign)BOOL isSelected;


-(void)setNormalImage:(UIImage *)normalImage andSelectedImage:(UIImage*)selectedImage;

@end
