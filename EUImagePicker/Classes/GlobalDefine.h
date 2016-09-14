//
//  GlobalDefine.h
//  Pods
//
//  Created by zhangjie on 16/9/14.
//
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

#define RUN_IN_MAIN_THREAD_START dispatch_async(dispatch_get_main_queue(), ^{
#define RUN_IN_MAIN_THREAD_END });

#define SCREEN_SCALE [UIScreen mainScreen].scale
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif

