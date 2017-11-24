//
//  YRAlbumNavigationController.m
//  YRAlbumTool
//
//  Created by 　yangrui on 2017/11/22.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "YRAlbumNavigationController.h"

@interface YRAlbumNavigationController ()

@end

@implementation YRAlbumNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setYRNavbarStyle];
}


// 拦截push事件
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count ) { // 说明时push 出来的
        UIBarButtonItem *leftItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClick)];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    
    
    if ([viewController isKindOfClass:NSClassFromString(@"GHRoomSceneDeViceShareViewController")]) {
        if (self.childViewControllers.count > 1) {
            viewController.hidesBottomBarWhenPushed  = YES;
        }
    }
    else{
        
        if (self.childViewControllers.count > 0) {
            viewController.hidesBottomBarWhenPushed  = YES;
        }
    }
    
    
    [super pushViewController:viewController animated:animated];
    
}

-(void)leftItemClick{
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self popViewControllerAnimated:YES];
    
}

@end
