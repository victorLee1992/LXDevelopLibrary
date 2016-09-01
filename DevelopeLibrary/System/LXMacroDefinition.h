//
//  LXMacroDefinition.h
//  CPLCountryFair
//
//  Created by victor on 16/6/23.
//  Copyright © 2016年 欣亨. All rights reserved.
//

#ifndef LXMacroDefinition_h
#define LXMacroDefinition_h


#if defined (DEBUG) && DEBUG ==1
#define LXLog(...)  NSLog(__VA_ARGS__)
#else
#define LXLog(...)

#endif


// 单例模式
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;
//+ (void) purgeSharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}


#endif /* LXMacroDefinition_h */
