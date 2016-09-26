//
//  EUImagePickerViewController.m
//  Pods
//
//  Created by zhangjie on 16/9/13.
//
//

#import "EUImagePickerViewController.h"
#import "EUAlbumTableViewCell.h"
#import "AlbumModel.h"
#import "EUPhotoManager.h"
#import "EUImagePickerDetailViewController.h"

static NSString *cellIdentifier = @"EUAlbumTableViewCell";

@interface EUImagePickerViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *albumTableView;

@property (nonatomic, strong) NSMutableArray<AlbumModel *> *albumList;

@end

@implementation EUImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.albumTableView];
    [self customNavigationBar];
    
    [self loadPhotoAlbums];
}

- (void)customNavigationBar {
    self.navigationItem.title = @"相册列表";
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

- (void)loadPhotoAlbums {
    [[EUPhotoManager sharedPhotoManager] getAllAlbums:^(NSArray<AlbumModel *> *models) {
        [self.albumList addObjectsFromArray:models];
    }];
}

- (UITableView *)albumTableView {
    if (_albumTableView == nil) {
        CGRect rect = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
        _albumTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _albumTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _albumTableView.delegate = self;
        _albumTableView.dataSource = self;
        _albumTableView.rowHeight = 185/2.0f;
        
        [_albumTableView registerClass:[EUAlbumTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _albumTableView;
}

- (NSMutableArray<AlbumModel *> *)albumList {
    if (_albumList == nil) {
        _albumList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _albumList;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albumList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EUAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    AlbumModel *album = self.albumList[indexPath.row];
    [cell setAlbum:album];
    return cell;
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - public
- (void)showCameraRollAlbum {
    
}
@end
