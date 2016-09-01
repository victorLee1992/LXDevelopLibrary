//
//  LXPopWindowView.m
//  AccidentClaims
//
//  Created by victor on 16/8/1.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXPopWindowView.h"

@implementation LXPopWindowView

-(void)createUI{
    
    self.frame = [UIScreen mainScreen].bounds;
    _coverView = [[UIView alloc]initWithFrame:self.frame];
    [_coverView setBackgroundColor:[UIColor blackColor]];
    _coverView.alpha =0;
    [self addSubview:_coverView];
    
    _customeBackView = [[UIView alloc]init];
    [self addSubview:_customeBackView];
}



-(void)show{
    
    [UIView animateWithDuration:0.5 animations:^{
        _coverView.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
    }];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = window.subviews[0];
    [topView addSubview:self];
    [self showAnimation];
}

- (void)showAnimation {
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [_customeBackView.layer addAnimation:popAnimation forKey:nil];
}

-(void)dismiss{
    
    [self hideAnimation];
}

- (void)hideAnimation{
    [UIView animateWithDuration:0.4 animations:^{
        _coverView.alpha = 0.0;
        _customeBackView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
