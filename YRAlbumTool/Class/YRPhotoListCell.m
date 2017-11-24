//
//  YRPhotoListCell.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/23.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "YRPhotoListCell.h"

@interface YRPhotoListCell()

@property(nonatomic, strong)UIImageView *imgV;
@end




@implementation YRPhotoListCell


-(instancetype)initWithFrame:(CGRect)frame{


    self = [super initWithFrame:frame];
    if (self) {
        [self imgV];
    }
    
    return self;
}

-(UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self addSubview:_imgV];
        return _imgV;
    }
    return _imgV;
}


-(void)setAsset:(PHAsset *)asset{
    _asset = asset;
    
    if (asset) {
        __weak typeof( self) weakSelf = self;
        [PHAsset requestImageForAsset:asset size:CGSizeMake(60, 60) callBack:^(UIImage *assetImage) {
            weakSelf.imgV.image = assetImage;
            
        }];
    }
    else{
        
        self.imgV.image = nil;
    }
     
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.imgV.frame = self.bounds;
}

@end
