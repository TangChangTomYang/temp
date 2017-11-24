//
//  YRAlbumListCell.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/23.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "YRAlbumListCell.h"
//#import "PHAssetCollection+custom.h"
//#import "PHAsset+custom.h"

@implementation YRAlbumListCell


-(void)setAssetCollection:(PHAssetCollection *)assetCollection{
    _assetCollection = assetCollection;
    
    if (assetCollection) {
        PHAsset *asset = [PHAsset fengMianImageAssetInAssetCollcetion:assetCollection];
        self.textLabel.text = assetCollection.localizedLocationNames.firstObject;
        ;
        self.detailTextLabel.text = [NSString stringWithFormat:@"(%ld)",[PHAsset allImageAssetInAssetCollcetion:assetCollection].count];
        
        __weak typeof( self) weakSelf = self;
        [PHAsset requestImageForAsset:asset size:CGSizeMake(60, 60) callBack:^(UIImage *assetImage) {
            weakSelf.imageView.image = assetImage;
            
        }];
    }
    
    else{
        
        
        self.textLabel.text  = nil;
        self.detailTextLabel.text = nil;
        self.imageView.image = nil;
    }
  
}

@end
