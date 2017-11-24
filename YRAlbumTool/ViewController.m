//
//  ViewController.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/22.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    YRAlbumListViewController *albumListVC = [[YRAlbumListViewController alloc]init];
    
    
    YRAlbumNavigationController *nav = [[YRAlbumNavigationController alloc]initWithRootViewController:albumListVC];
    [nav pushViewController:[[YRPhotoListViewController alloc]init] animated:NO];
    //[nav addChildViewController:[[YRPhotoListViewController alloc]init]];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentViewController:nav animated:YES completion:nil];
    });
    
    

}


@end
