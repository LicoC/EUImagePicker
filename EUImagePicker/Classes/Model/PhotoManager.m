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

- (void)getAllAlbums:(void(^)(NSArray<AlbumModel *> *models))completion {
    NSMutableArray *albumArray = [[NSMutableArray alloc] init];
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"createDate" ascending:NO]];
    
}

- (void)getCameraRollAlbum:(void(^)(AlbumModel *model))completion {
    
}
@end
