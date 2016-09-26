//
//  AlbumCellView.m
//  Pods
//
//  Created by zhangjie on 16/9/13.
//
//

#import "AlbumCellView.h"
#import "Masonry.h"

static const CGFloat coverWidth = 150.0/2.0f;
static const CGFloat coverHeight = 180.0/2.0f;
static const CGFloat labelPadding = 12.0f;
static const CGFloat arrowRightPadding = 15.0/2.0f;
static const CGFloat imagePadding = 5/2.0;

@interface AlbumCellView ()

@property (nonatomic, strong) UIImageView *albumCover;
@property (nonatomic, strong) UILabel *albumName;
@property (nonatomic, strong) UIImageView *arrowView;

@end

@implementation AlbumCellView

- (instancetype)initCellWithAlbumCover:(UIImage *)coverImage
                             albumName:(NSString *)nameString {
    self = [super init];
    if (self) {
        self.coverImage = coverImage;
        self.nameString = nameString;
        
        [self customInit];
        [self layout];
    }
    return self;
}

- (void)customInit {
    [self addSubview:self.albumCover];
    [self addSubview:self.albumName];
//    [self addSubview:self.arrowView];
}

- (void)layout {
    [self.albumCover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(imagePadding);
        make.top.equalTo(self).with.offset(imagePadding);
        make.bottom.equalTo(self).with.offset(-imagePadding);
        make.width.mas_equalTo(coverWidth);
    }];
    
    [self.albumName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.albumCover.mas_right).with.offset(labelPadding);
        make.top.height.equalTo(self.albumCover);
    }];
    
//    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self).with.offset(-arrowRightPadding);
//        make.top.equalTo(self);
//        make.centerY.equalTo(self);
//    }];
}

- (UIImageView *)albumCover {
    if (_albumCover == nil) {
        CGRect frame = CGRectMake(imagePadding, imagePadding, coverWidth, coverHeight);
        _albumCover = [[UIImageView alloc] initWithFrame:frame];
        _albumCover.contentMode = UIViewContentModeScaleAspectFill;
        _albumCover.clipsToBounds = YES;
    }
    return _albumCover;
}

- (UILabel *)albumName {
    if (_albumName == nil) {
        CGFloat x = imagePadding + coverWidth + labelPadding;
//        CGRect frame = CGRectMake(leftPadding, , <#CGFloat width#>, <#CGFloat height#>)
//        _albumName = [[UILabel alloc] initWithFrame:];
        _albumName = [[UILabel alloc] init];
        _albumName.text = self.nameString;
        _albumName.textAlignment = NSTextAlignmentCenter;
    }
    return _albumName;
}

- (UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture_list_next_normal"]];
        [_arrowView setHighlightedImage:[UIImage imageNamed:@"picture_list_next_press"]];
    }
    return _arrowView;
}

#pragma mark - public method
- (void)setCoverImage:(UIImage *)coverImage {
    _coverImage = coverImage;
    [self.albumCover setImage:coverImage];
}

- (void)setNameString:(NSString *)nameString {
    _nameString = nameString;
    [self.albumName setText:nameString];
}
@end
