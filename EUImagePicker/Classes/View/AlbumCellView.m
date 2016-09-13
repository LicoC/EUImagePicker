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
static const CGFloat labelPadding = 12.0f;
static const CGFloat arrowRightPadding = 15.0/2.0f;

@interface AlbumCellView ()

@property (nonatomic, strong) UIImageView *albumCover;
@property (nonatomic, strong) UILabel *albumName;
@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UIImage *coverImage;
@property (nonatomic, copy) NSString *nameString;

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
    [self addSubview:self.arrowView];
}

- (void)layout {
    [self.albumCover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(coverWidth, coverWidth));
    }];
    
    [self.albumName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.albumCover.mas_right).with.offset(labelPadding);
        make.top.height.equalTo(self);
        make.right.equalTo(self.arrowView.mas_left);
    }];
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-arrowRightPadding);
        make.top.equalTo(self);
    }];
}

- (UIImageView *)albumCover {
    if (_albumCover == nil) {
        _albumCover = [[UIImageView alloc] initWithImage:self.coverImage];
    }
    return _albumCover;
}

- (UILabel *)albumName {
    if (_albumName == nil) {
        _albumName = [[UILabel alloc] init];
        _albumName.text = self.nameString;
    }
    return _albumName;
}

- (UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture_list_next_normal"]];
    }
    return _arrowView;
}
@end
