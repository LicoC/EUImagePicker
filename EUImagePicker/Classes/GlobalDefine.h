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

#endif

