//
//  YRPhotoListViewController.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/22.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "YRPhotoListViewController.h"
#import <Photos/Photos.h>
#import "PHPhotoLibrary+firstTimeUse.h"
#import "YRPhotoListCell.h"


@interface YRPhotoListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>


@property(nonatomic, strong)UICollectionView *collectionView;


@property(nonatomic, strong)NSMutableArray<PHAsset *> *assetResults;
@end

static CGFloat margin = 5;
static NSString *ID = @"YRAlbumListCell";
@implementation YRPhotoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor orangeColor];
    
    __weak typeof(self) weakSelf = self;
    [PHPhotoLibrary  fetchAuthorizationStatusComplete:^(BOOL isOk) {
       
        if (isOk) {
            
            [weakSelf collectionView];
            
            
        }
    }];
    
    
}

@synthesize assetCollection = _assetCollection;

-(PHAssetCollection *)assetCollection{
    if (!_assetCollection ) {
        _assetCollection = [PHAssetCollection systemCameraRollAlbum];
    }
    return _assetCollection;
}


-(void)setAssetCollection:(PHAssetCollection *)assetCollection{
    
    _assetCollection = assetCollection;
    [self.collectionView reloadData];

}


-(NSMutableArray<PHAsset *> *)assetResults{
    if (!_assetResults) {
        _assetResults = [PHAsset allImageAssetInAssetCollcetion:self.assetCollection];
    }
    return _assetResults;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        NSInteger maxCountPerRow = 4;
        
        CGFloat itemSizeW = ([UIScreen mainScreen].bounds.size.width - margin* (maxCountPerRow + 1)) / maxCountPerRow;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.itemSize = CGSizeMake(itemSizeW, itemSizeW);
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        
        [_collectionView registerClass:[YRPhotoListCell class] forCellWithReuseIdentifier:ID];
        [self.view addSubview:_collectionView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

   
    collectionView.contentInset = UIEdgeInsetsMake(margin + CGRectGetMaxY(self.navigationController.navigationBar.frame), margin, margin, margin);
    
    return self.assetResults.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    
   YRPhotoListCell *cell =  (YRPhotoListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    PHAsset *asset = self.assetResults[indexPath.row];
    cell.asset = asset;
    return cell;
}



@end
