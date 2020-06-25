//
//  TabBarController.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "TabBarController.h"
#import "ViewController.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "MainViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController* vc1 = [MainViewController new];
    GalleryViewController* vc2 = [GalleryViewController new];
    InfoViewController* vc3 = [InfoViewController new];
    
    UINavigationController *navController_vc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    [navController_vc1.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]}];
    navController_vc1.navigationBar.barTintColor = [UIColor colorWithRed:0.98 green:0.80 blue:0.47 alpha:1.0];
    
    UINavigationController *navController_vc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    [navController_vc2.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]}];
    navController_vc2.navigationBar.barTintColor = [UIColor colorWithRed:0.98 green:0.80 blue:0.47 alpha:1.0];
    
    UINavigationController *navController_vc3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    [navController_vc3.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold]}];
    navController_vc3.navigationBar.barTintColor = [UIColor colorWithRed:0.98 green:0.80 blue:0.47 alpha:1.0];
    
    NSArray* controllers = [NSArray arrayWithObjects:navController_vc1, navController_vc2, navController_vc3, nil];
    [self setViewControllers:controllers];
    
    UITabBarItem* vc1_button = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"firstVC"] selectedImage:[UIImage imageNamed:@"firstVC_selected"]];
    UITabBarItem* vc2_button = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"secondVC"] selectedImage:[UIImage imageNamed:@"secondVC_selected"]];
    UITabBarItem* vc3_button = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"thirdVC"] selectedImage:[UIImage imageNamed:@"thirdVC_selected"]];
    
    navController_vc1.tabBarItem = vc1_button;
    navController_vc2.tabBarItem = vc2_button;
    navController_vc3.tabBarItem = vc3_button;
}
@end
