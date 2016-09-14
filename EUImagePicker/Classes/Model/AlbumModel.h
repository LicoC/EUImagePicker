//
//  AlbumModel.h
//  Pods
//
//  Created by zhangjie on 16/9/13.
//
//

#import <Foundation/Foundation.h>

@class PHFetchResult;

@interface AlbumModel : NSObject

@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) PHFetchResult *albumResult;

@end
