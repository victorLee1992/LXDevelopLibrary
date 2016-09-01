//
//  LXBaseTabController.h
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const kNotification_HideBotomWhenPush;

typedef NS_ENUM(NSInteger,LXTabBarType) {
    
    LXTabBarTypeSystem,
    LXTabBarTypeCustom
};


@interface LXBaseTabController : UITabBarController

@property(nonatomic,strong)NSArray * childrenVcArray;
@property(nonatomic,strong)NSArray * childrenBarArray;


@property(nonatomic,strong)UIView * tabBarView;// 自定义类型时 必须参数

-(instancetype)initWithType:(LXTabBarType)type;

// 此处设置 对应的子控制器数组和 子barItem 数组
-(void)setChildrenVcArray:(NSArray *)childrenVcArray andChildrenBarArray:(NSArray*)barArray;

// 当使用的是自定义tabbar风格，使用此方法去切换菜单栏
-(void)switchBarIndex:(NSInteger)index;

@end
