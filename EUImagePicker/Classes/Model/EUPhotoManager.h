//
//  EUPhotoManager.h
//  Pods
//
//  Created by zhangjie on 16/9/14.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "AlbumModel.h"

@interface EUPhotoManager : NSObject

+ (instancetype)sharedPhotoManager;

- (void)getAllAlbums:(void(^)(NSArray<AlbumModel *> *models))completion;

- (void)getCameraRollAlbum:(void(^)(AlbumModel *model))completion;

- (void)getCoverImageWithAlbumModel:(AlbumModel *)album photoSize:(CGSize)imageSize completion:(void(^)(UIImage *cover))completion;
@end
