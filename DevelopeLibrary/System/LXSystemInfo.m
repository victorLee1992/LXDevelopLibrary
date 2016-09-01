//
//  LXSystemInfo.m
//  CPLCountryFair
//
//  Created by victor on 16/6/23.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "LXSystemInfo.h"

@implementation LXSystemInfo





+(NSString *)appVersion{
    
    NSString * version = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"];
    return version;
}


+(NSString *)appIdentifier{
    
    NSString * __identifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return __identifier;
    
}


CGFloat nativeScale(void) {
    static CGFloat scale = 0.0f;
    if (scale == 0.0f) {
        CGFloat width = Screen_width;
        scale = width / 375.0f;
    }
    return scale * 2;
}

@end
