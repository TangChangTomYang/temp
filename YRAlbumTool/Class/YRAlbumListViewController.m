//
//  GHAlbumListViewController.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/22.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "YRAlbumListViewController.h"
#import <Photos/Photos.h>
#import "YRAlbumListCell.h"

@interface YRAlbumListViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic, strong)UITableView *tableView;



@property(nonatomic, strong) NSMutableArray<PHAssetCollection *> *smartAlbumCollection;
@end

@implementation YRAlbumListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self tableView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

#pragma mark- lazy
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =  [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


-(NSMutableArray<PHAssetCollection *> *)smartAlbumCollection{
    if (!_smartAlbumCollection) {
        _smartAlbumCollection = [PHAssetCollection smartAlbumCollection];
    }
    return _smartAlbumCollection;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.smartAlbumCollection.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"album";
    
    YRAlbumListCell *cell = (YRAlbumListCell *)[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[YRAlbumListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    PHAssetCollection *assetCollection = self.smartAlbumCollection[indexPath.row];
    cell.assetCollection = assetCollection;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PHAssetCollection *assetCollection = self.smartAlbumCollection[indexPath.row];

    YRPhotoListViewController *photoListVc = [[YRPhotoListViewController alloc]init];
    photoListVc.assetCollection = assetCollection;
    
    [self.navigationController pushViewController:photoListVc animated:YES];
}













@end
