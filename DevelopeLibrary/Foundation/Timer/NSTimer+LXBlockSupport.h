//
//  NSTimer+LXBlockSupport.h
//  LXDevelopLibrary
//
//  Created by victor on 16/5/31.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LXBlockSupport)


// 注意  在调用时，在block中使用 weakself 去执行操作

+(NSTimer *)lx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats;



@end
