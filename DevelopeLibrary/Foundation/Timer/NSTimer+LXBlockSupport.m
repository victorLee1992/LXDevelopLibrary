//
//  NSTimer+LXBlockSupport.m
//  LXDevelopLibrary
//
//  Created by victor on 16/5/31.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import "NSTimer+LXBlockSupport.h"

@implementation NSTimer (LXBlockSupport)


+(NSTimer *)lx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)())block repeats:(BOOL)repeats{
    
    // 此时 timer的 target是NSTImer类对象，但是类对象是个单例，无需回收
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(lx_blockInvoke:) userInfo:[block copy] repeats:repeats];
    
}

// 通过 timer的useInfo 来保留 block，然后在block中使用 weak引用打破保留
+(void)lx_blockInvoke:(NSTimer*)timer{
    
    void(^block)() =  timer.userInfo;
    if (block) {
        block();
    }
}


@end
