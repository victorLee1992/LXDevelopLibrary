//
//  LXBaseWebViewController.m
//  AccidentClaims
//
//  Created by 全名财富 on 16/8/11.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXBaseWebViewController.h"
#import "LXSystemInfo.h"

@interface LXBaseWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView * uiWebView;

@end
@implementation LXBaseWebViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    _uiWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    [_uiWebView setDelegate:self];
    [self.view addSubview:_uiWebView];
    
    self.navigationItem.title = [self getNavigationTitle];

}



-(NSString *)getNavigationTitle{
    
    if (_uiTitle !=nil) {
        return _uiTitle;
    }
    return @"我的title";
}



#pragma mark - UIWebViewDelegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
}



@end
