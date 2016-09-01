//
//  LXBaseViewController.m
//  AccidentClaims
//
//  Created by victor on 16/7/25.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXBaseViewController.h"
#import "LXSystemInfo.h"

@interface LXBaseViewController ()

@end

@implementation LXBaseViewController



-(void)viewDidLoad{
    [super viewDidLoad];
 
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _uiTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height) style:UITableViewStylePlain];
    [_uiTableView setDelegate:self];
    [_uiTableView setDataSource:self];
    [self.view addSubview:_uiTableView];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.uiTableView.tableFooterView = [self createFooterView];
    self.navigationItem.title = [self getNavigationTitle];
    
}


-(NSString *)getNavigationTitle{
    
    return @"我的title";
}


#pragma mark - UITableViewDataSource - UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(id)cellForIndexPathAtRow:(NSInteger)row andAtSection:(NSInteger)section{
    
    NSIndexPath * path = [NSIndexPath indexPathForRow:row inSection:section];
    
    UITableViewCell *cell = [self.uiTableView cellForRowAtIndexPath:path];
    
    return cell;
}

-(UIView*)createFooterView{
    
    return [UIView new];
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
