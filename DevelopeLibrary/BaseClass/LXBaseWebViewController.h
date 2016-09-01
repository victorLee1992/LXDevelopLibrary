//
//  LXBaseWebViewController.h
//  AccidentClaims
//
//  Created by 全名财富 on 16/8/11.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXBaseWebViewController : UIViewController

@property(nonatomic,strong)NSString * uiTitle;
@property(nonatomic,strong)NSString * linkUrl;

@property(nonatomic,strong)NSString * productId;

-(NSString*)getNavigationTitle;


@end
