//
//  PhotoManager.m
//  Pods
//
//  Created by zhangjie on 16/9/14.
//
//

#import "PhotoManager.h"

@implementation PhotoManager

+ (instancetype)sharedPhotoManager {
    static PhotoManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];

    });
    
    return manager;
}

- (void)getCoverImageWithAlbumModel:(AlbumModel *)album
                         completion:(void(^)(UIImage *cover))completion {
    
}
@end
