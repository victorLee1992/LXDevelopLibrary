//
//  LXBaseViewController.h
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

#define rowIndex  [indexPath row]

@interface LXBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * uiTableView;
@property(nonatomic,strong,readonly)NSMutableArray * sessionTaskArray;


-(NSString*)getNavigationTitle;

-(id)cellForIndexPathAtRow:(NSInteger)row andAtSection:(NSInteger)section;



@end
