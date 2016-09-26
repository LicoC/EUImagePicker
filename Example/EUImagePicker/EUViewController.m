//
//  EUViewController.m
//  EUImagePicker
//
//  Created by zhangjie on 09/13/2016.
//  Copyright (c) 2016 zhangjie. All rights reserved.
//

#import "EUViewController.h"
#import "EUImagePickerViewController.h"

@interface EUViewController ()

@property (nonatomic, strong) UIButton *showImage;

@end

@implementation EUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGFloat x = CGRectGetWidth(self.view.bounds)/3;
    CGFloat y = CGRectGetHeight(self.view.bounds)/2;
    
    _showImage = [[UIButton alloc] initWithFrame:CGRectMake(x, y, 100, 100)];
    [_showImage setTitle:@"显示照片" forState:UIControlStateNormal];
    [_showImage setBackgroundColor:[UIColor blackColor]];
    [_showImage addTarget:self action:@selector(showImageClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.showImage];
}

- (void)showImageClick:(id)sender {
    EUImagePickerViewController *vc = [[EUImagePickerViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
