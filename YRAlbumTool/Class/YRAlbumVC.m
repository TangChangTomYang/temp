//
//  YRAlbumVC.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/22.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "YRAlbumVC.h"

@interface YRAlbumVC ()

@end

@implementation YRAlbumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    if (self.navigationController ) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }

}

-(void)rightItemClick{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
