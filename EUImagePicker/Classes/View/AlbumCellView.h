//
//  AlbumCellView.h
//  Pods
//
//  Created by zhangjie on 16/9/13.
//
//

#import <UIKit/UIKit.h>

@interface AlbumCellView : UIView

@property (nonatomic, strong) UIImage *coverImage;
@property (nonatomic, copy) NSString *nameString;

- (instancetype)initCellWithAlbumCover:(UIImage *)coverImage
                             albumName:(NSString *)nameString;

@end
