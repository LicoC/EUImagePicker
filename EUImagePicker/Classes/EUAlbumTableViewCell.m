//
//  EUAlbumTabelViewCell.m
//  Pods
//
//  Created by zhangjie on 16/9/13.
//
//

#import "EUAlbumTableViewCell.h"
#import "AlbumCellView.h"
#import "AlbumModel.h"
#import "PhotoManager.h"

@interface EUAlbumTableViewCell()

@property (nonatomic, strong) AlbumCellView *cellView;

@end

@implementation EUAlbumTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.cellView];
    }
    return self;
}

- (AlbumCellView *)cellView {
    if (_cellView == nil) {
        _cellView = [[AlbumCellView alloc] initCellWithAlbumCover:nil albumName:self.album.albumName];
    }
    return _cellView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAlbum:(AlbumModel *)album {
    self.album = album;
    
    //get album info from album and then update cellView
    [[PhotoManager sharedPhotoManager] getCoverImageWithAlbumModel:self.album completion:^(UIImage *cover) {
       //ensure main thread
        [self.cellView setCoverImage:cover];
        [self.cellView setNameString:self.album.albumName];
        
    }];
}

@end
