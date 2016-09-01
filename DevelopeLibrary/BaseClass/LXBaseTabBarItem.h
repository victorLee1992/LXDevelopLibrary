//
//  LXBaseTabBarItem.h
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXBaseTabBarItem : UITabBarItem


@property(nonatomic,strong)UIImage * selectImage;
@property(nonatomic,strong)UIImage * normalImage;
@property(nonatomic,assign)NSInteger tag0;


-(instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)index;


-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

@end
