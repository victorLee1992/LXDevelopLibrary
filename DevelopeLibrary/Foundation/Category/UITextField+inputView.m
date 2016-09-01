//
//  UITextField+inputView.m
//  NationalWealth
//
//  Created by victor on 15/10/30.
//  Copyright © 2015年 欣亨. All rights reserved.
//

#import "UITextField+inputView.h"
#import "LXSystemInfo.h"

@implementation UITextField (inputView)



-(void)createInputView{
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 40*displayScale)];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doFinishAction:)];
    [topView setItems:@[item1,item2,item]];
    
    [self setInputAccessoryView:topView];
}



-(void)doFinishAction:(id)sender{
    [self resignFirstResponder];
}

@end
