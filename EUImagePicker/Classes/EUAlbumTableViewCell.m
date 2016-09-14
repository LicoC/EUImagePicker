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
#import "Masonry.h"
#import "GlobalDefine.h"

static const CGFloat cellHeight = 150.0f;

@interface EUAlbumTableViewCell()

@property (nonatomic, strong) AlbumCellView *cellView;

@end

@implementation EUAlbumTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellView];
        [self.cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView);
            make.width.mas_equalTo(@(SCREEN_WIDTH));
            make.height.mas_equalTo(@(cellHeight));
        }];
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
    _album = album;
    
    //get album info from album and then update cellView
    [[PhotoManager sharedPhotoManager] getCoverImageWithAlbumModel:self.album completion:^(UIImage *cover) {
       //ensure main thread
        [self.cellView setCoverImage:cover];
        [self.cellView setNameString:self.album.albumName];
        
    }];
    
    [self.cellView setNameString:self.album.albumName];
}

@end
