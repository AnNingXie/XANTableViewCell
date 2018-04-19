//
//  XANTabBarController.m
//  
//
//  Created by XAN on 2017/12/8.
//  Copyright © 2017年 zhongkeyuan. All rights reserved.
//  自定义UITabBarController

#import "XANTabBarController.h"
#import "XANHomeController.h"
#import "XANNavigationController.h"
#import "XANPCH.h"
@interface XANTabBarController ()

@end

@implementation XANTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //首页
    XANHomeController *home=[[XANHomeController alloc]init];
    [self setUpChildViewController:home title:@"首页" imageName:@"homeIconNormal" selectedImageName:@"homeIconSelected"];
    //我的
    XANHomeController *map=[[XANHomeController alloc]init];
    [self setUpChildViewController:map title:@"我的" imageName:@"homeIconNormal" selectedImageName:@"homeIconSelected"];
}

/**
 初始化一个子控制器
 
 @param childViewController 子控制器
 @param title 标题
 @param imageName 图标
 @param selectedImageName 选中图标
 */
-(void)setUpChildViewController:(UIViewController *)childViewController
                          title:(NSString *)title
                      imageName:(NSString *)imageName
              selectedImageName:(NSString *)selectedImageName{
    childViewController.title=title;
    //正常状态下文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:10],NSForegroundColorAttributeName:[UIColor whiteColor]}   forState:UIControlStateNormal];
    //文字选中颜色
    self.tabBar.tintColor=[UIColor whiteColor];
    //TabBar背景色
    UIView *tabBarBackGroundColor=[[UIView alloc]init];
    tabBarBackGroundColor.frame=CGRectMake(0, 0, KScreenWidth, TabbarHeight);
    tabBarBackGroundColor.backgroundColor=XANRGBColor(0, 157, 145);
    [[UITabBar appearance] insertSubview:tabBarBackGroundColor atIndex:0];
    
    //消除TabBar图标的渲染效果 是图片保持原图效果
    UIImage *imageNormal=[UIImage imageNamed:imageName];
    childViewController.tabBarItem.image=[imageNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *imageSelect=[UIImage imageNamed:selectedImageName];
    childViewController.tabBarItem.selectedImage=[imageSelect imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //将一个控制器包装成一个导航控制器
    XANNavigationController *navigation=[[XANNavigationController alloc]initWithRootViewController:childViewController];
    navigation.title=title;
    [self addChildViewController:navigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
