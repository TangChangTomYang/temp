//
//  UINavigationController+GHNav.m
//  NewProduct
//
//  Created by 　yangrui on 2017/11/10.
//  Copyright © 2017年 　yangrui. All rights reserved.
//

#import "UINavigationController+YRNav.h"

@implementation UINavigationController (YRNav)




  /**通用 导航栏样式*/
-(void)setYRNavbarStyle{

    //导航蓝标题字体大小颜色
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName :[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    self.navigationBar.translucent = YES;
    [self.navigationBar setTitleTextAttributes:dic];
}


  /**云控制 导航栏样式*/
-(void)setCloudNavbarStyle{
    
    //导航蓝标题字体大小颜色
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"geo_bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName :[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    self.navigationBar.translucent = YES;
    [self.navigationBar setTitleTextAttributes:dic];
}


@end
