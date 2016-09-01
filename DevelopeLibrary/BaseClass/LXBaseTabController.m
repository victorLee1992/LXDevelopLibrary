//
//  LXBaseTabController.m
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXBaseTabController.h"
#import "LXCustomTabBarItem.h"
#import "LXBaseTabBarItem.h"
#import "LXSystemInfo.h"

NSString * const kNotification_HideBotomWhenPush =@"kNotification_HideBotomWhenPush";

@interface LXBaseTabController ()

@property(nonatomic,assign)LXTabBarType  type;
@end

@implementation LXBaseTabController



-(instancetype)initWithType:(LXTabBarType)type{
    
    if (self = [super init]) {
        _type = type;
        // viewdidload 要先于init执行
        [self construct];
    }
    return self;
}


-(void)setChildrenVcArray:(NSArray *)childrenVcArray andChildrenBarArray:(NSArray *)barArray{
    
    _childrenVcArray = childrenVcArray;
    self.viewControllers = _childrenVcArray;
    
    _childrenBarArray = barArray;
}


-(void)construct{
    
    if (_type == LXTabBarTypeSystem) {
        
        [_childrenBarArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIViewController * childVc = (UIViewController*)[_childrenVcArray objectAtIndex:idx];
            if (childVc) {
                LXBaseTabBarItem * item = (LXBaseTabBarItem*)obj;
                [childVc setTabBarItem:item];
            }
            else{
                *stop = YES;
            }
        }];
    }
    else{
        if (!_tabBarView) {
            NSAssert(NO, @"Assert Info: custom background tabBarView is not initilized");
        }
        _tabBarView.frame = self.tabBar.bounds;
        [self.tabBar addSubview:_tabBarView];
        
        CGFloat width = Screen_width/[_childrenBarArray count];
        [_childrenBarArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LXCustomTabBarItem * customItem = (LXCustomTabBarItem*)obj;
            if (![customItem isKindOfClass:[LXCustomTabBarItem class]]) {
                NSAssert(NO, @"Assert info: custom bar Item is not belong to the class of LXCustomTabBarItem");
            }
            [customItem setFrame:CGRectMake(width*idx, 0, width, TabBarItem_height)];
            [customItem setTag:100+idx];
            [_tabBarView addSubview:customItem];
            [customItem addTarget:self action:@selector(switchChildItem:) forControlEvents:UIControlEventTouchUpInside];
        }];
    }
}

// 主动点击 button切换菜单
-(void)switchChildItem:(UIButton*)sender{
    // 切换相应的被选中item的图片
    for (LXCustomTabBarItem * temp in _childrenBarArray) {
        
        if ([temp isEqual:sender]) {
            temp.isSelected = YES;
        }
        else{
            temp.isSelected = NO;
        }
    }
    // 执行 切换操作
    NSUInteger index = sender.tag-100;
    [self setSelectedIndex:index];
}

// 通过 索引切换菜单
-(void)switchBarIndex:(NSInteger)index{
    // 先获取对应的button ，再出发点击事件
    UIButton *sender = [_childrenBarArray objectAtIndex:index];
    [self switchChildItem:sender];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCustomBar:) name:kNotification_HideBotomWhenPush object:nil];
    /*  让子类去实现
    // 默认选择了第一个子视图
    if (_type == LXTabBarTypeCustom) {
        LXCustomTabBarItem * item = (LXCustomTabBarItem*)[_childrenBarArray firstObject];
        item.isSelected = YES;
    }
     */
    // Do any additional setup after loading the view.
}

-(void)changeCustomBar:(NSNotification*)notification{
    
    BOOL hidden = [notification.object boolValue];
    [_tabBarView setHidden:hidden];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
