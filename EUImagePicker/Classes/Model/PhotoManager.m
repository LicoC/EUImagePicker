//
//  PhotoManager.m
//  Pods
//
//  Created by zhangjie on 16/9/14.
//
//

#import "PhotoManager.h"
#import "GlobalDefine.h"

static const CGFloat kios8 = 8.0;
static const CGFloat kios9 = 9.0;

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
    PHAssetCollectionSubtype smartAlbumSubType = PHAssetCollectionSubtypeSmartAlbumVideos | PHAssetCollectionSubtypeSmartAlbumFavorites |
        PHAssetCollectionSubtypeSmartAlbumRecentlyAdded | PHAssetCollectionSubtypeSmartAlbumBursts |
    PHAssetCollectionSubtypeSmartAlbumUserLibrary;
    
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.doubleValue;
    
    if (systemVersion < kios8) {
        NSLog(@"Unsupport version");
        return;
    }
    
    if (systemVersion >= kios9) {
        smartAlbumSubType = smartAlbumSubType | PHAssetCollectionSubtypeSmartAlbumSelfPortraits | PHAssetCollectionSubtypeSmartAlbumScreenshots;
    }

    //smart album
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:smartAlbumSubType options:nil];

    NSMutableArray *albumArray = [[NSMutableArray alloc] init];
    
    [self addAlbumfrom:smartAlbums toAlbumArray:albumArray];
    
    //regular album
    PHFetchResult *regularAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    [self addAlbumfrom:regularAlbums toAlbumArray:albumArray];
    
    if (completion && albumArray.count > 0) {
        completion(albumArray);
    }
}

- (void)addAlbumfrom:(PHFetchResult *)albums toAlbumArray:(NSMutableArray *)albumArray {
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];

    for (PHAssetCollection *collection in albums) {
        PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:option];
        if (fetchResult.count > 0) {
            [albumArray addObject:[self createAlbumModel:fetchResult name:collection.localizedTitle]];
        }
    }
}

- (AlbumModel *)createAlbumModel:(PHFetchResult *)fetchResult name:(NSString *)name {
    AlbumModel *model = [[AlbumModel alloc] init];
    model.albumName = name;
    model.albumResult = fetchResult;
    model.count = fetchResult.count;
    return model;
}

- (void)getCameraRollAlbum:(void(^)(AlbumModel *model))completion {
    
}
@end
