//
//  EUAlbumTabelViewCell.m
//  Pods
//
//  Created by zhangjie on 16/9/13.
//
//

#import "EUAlbumTabelViewCell.h"
#import "AlbumCellView.h"

@interface EUAlbumTabelViewCell()

@property (nonatomic, strong) UIView *cellView;

@end

@implementation EUAlbumTabelViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
