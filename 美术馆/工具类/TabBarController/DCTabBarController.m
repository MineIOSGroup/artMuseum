//
//  DCTabBarController.m
//  美术馆
//
//  Created by 邓超 on 15/11/20.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "DCTabBarController.h"
#import "HomePageViewController.h"
#import "ATNavigationController.h"

@interface DCTabBarController ()

@end

@implementation DCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tabBar setBarTintColor:[UIColor blackColor]];
    [self setTabBarItems];
    
    
}

/**
 *  设置TabBarItems
 */
- (void)setTabBarItems
{

    HomePageViewController *homeVC = [[HomePageViewController alloc] initWithNibName:@"HomePageViewController" bundle:nil];
    ATNavigationController *homeNC = [[ATNavigationController alloc] initWithRootViewController:homeVC];
    [self setTabBarItemWithNavigationCtroller:homeNC withString:@"iconfont-home"];
    
    self.viewControllers = @[homeNC];
}

/**
 *  设置TabBarItem图片和标题
 *
 *  @param navi 导航栏
 *  @param str  图片名称
 */
- (void)setTabBarItemWithNavigationCtroller:(UINavigationController *)navi
                                 withString:(NSString *)str
{
    navi.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:str] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@-拷贝", str]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
