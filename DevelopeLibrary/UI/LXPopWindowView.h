//
//  LXPopWindowView.h
//  AccidentClaims
//
//  Created by victor on 16/8/1.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXPopWindowView : UIView


@property(nonatomic,strong)UIView * coverView;  // 笼罩层
@property(nonatomic,strong)UIView* customeBackView; // 自定义视图


-(void)show;
-(void)dismiss;
-(void)createUI;

@end
