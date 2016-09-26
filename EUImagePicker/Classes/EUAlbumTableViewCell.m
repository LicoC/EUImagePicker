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
#import "EUPhotoManager.h"
#import "Masonry.h"
#import "GlobalDefine.h"

static const CGFloat cellHeight = 185.0/2.0f;

@interface EUAlbumTableViewCell()

@property (nonatomic, strong) AlbumCellView *cellView;

@end

@implementation EUAlbumTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellView];
        
        [self.cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.height.equalTo(self.contentView);
        }];
    }
    return self;
}

- (AlbumCellView *)cellView {
    if (_cellView == nil) {
        _cellView = [[AlbumCellView alloc] initCellWithAlbumCover:nil
                                                        albumName:self.album.albumName];
    }
    return _cellView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];    
}

- (void)setAlbum:(AlbumModel *)album {
    _album = album;
    
    //get album info from album and then update cellView
    [[EUPhotoManager sharedPhotoManager] getCoverImageWithAlbumModel:self.album photoSize:CGSizeMake(150.0/2.0, 180.0/2.0) completion:^(UIImage *cover) {
       //ensure main thread
        [self.cellView setCoverImage:cover];
        //make albumname with count
        [self.cellView setNameString:[self makeAlbumName]];
    }];
}

- (NSString *)makeAlbumName {
    NSString *name = [NSString stringWithFormat:@"%@ (%ld)", self.album.albumName, (long)self.album.count];
    return name;
}

@end
