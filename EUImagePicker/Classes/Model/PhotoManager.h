//
//  PhotoManager.h
//  Pods
//
//  Created by zhangjie on 16/9/14.
//
//

#import <Foundation/Foundation.h>

@class AlbumModel;

@interface PhotoManager : NSObject

+ (instancetype)sharedPhotoManager;

- (void)getCoverImageWithAlbumModel:(AlbumModel *)album completion:(void(^)(UIImage *cover))completion;
@end
