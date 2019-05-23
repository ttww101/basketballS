//
//  TabBarViewController.m
//  basketballS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "GameViewController.h"
#import "DataViewController.h"
#import "userCenterViewController.h"

@implementation TabBarViewController

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIStoryboard *storyboard2 = [UIStoryboard storyboardWithName:@"Game" bundle:nil];
        UIStoryboard *storyboard3 = [UIStoryboard storyboardWithName:@"Data" bundle:nil];
        UIStoryboard *storyboard4 = [UIStoryboard storyboardWithName:@"userCenter" bundle:nil];
        
        ViewController * firstViewController = [storyboard instantiateViewControllerWithIdentifier:@"Main"];
        UIViewController * firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        
        GameViewController * secondViewController = [storyboard2 instantiateViewControllerWithIdentifier:@"Game"];
        UIViewController * secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
        
        DataViewController * threeViewController = [storyboard3 instantiateViewControllerWithIdentifier:@"Data"];
        UIViewController * threeNavigationController = [[UINavigationController alloc] initWithRootViewController:threeViewController];
        
        userCenterViewController * fourViewController = [storyboard4 instantiateViewControllerWithIdentifier:@"userCenter"];
        UIViewController * fourNavigationController = [[UINavigationController alloc] initWithRootViewController:fourViewController];
        
        
        NSArray * tabBarItemsAttributes = [self tabBarItemsAttributes];
        NSArray * viewControllers = @[firstNavigationController, secondNavigationController, threeNavigationController, fourNavigationController];
        
        CYLTabBarController * tabBarController = [[CYLTabBarController alloc] init];
        
        tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
        tabBarController.viewControllers = viewControllers;
        
        _tabBarController = tabBarController;
        
    }
    
    return _tabBarController;
}


- (NSArray *)tabBarItemsAttributes {
    NSDictionary * tabBarItem1Attribute = @{
                                            CYLTabBarItemTitle : @"首頁",
                                            CYLTabBarItemImage : @"home_normal",
                                            CYLTabBarItemSelectedImage : @"home_highlight"
                                            };
    NSDictionary * tabBarItem2Attribute = @{
                                            CYLTabBarItemTitle : @"賽事",
                                            CYLTabBarItemImage : @"mycity_normal",
                                            CYLTabBarItemSelectedImage : @"mycity_highlight"
                                            };
    NSDictionary * tabBarItem3Attribute = @{
                                            CYLTabBarItemTitle : @"數據",
                                            CYLTabBarItemImage : @"mycity_normal",
                                            CYLTabBarItemSelectedImage : @"mycity_highlight"
                                            };
    NSDictionary * tabBarItem4Attribute = @{
                                            CYLTabBarItemTitle : @"我的",
                                            CYLTabBarItemImage : @"mycity_normal",
                                            CYLTabBarItemSelectedImage : @"mycity_highlight"
                                            };
    
    NSArray * tarBarItemsAttrbutes = @[tabBarItem1Attribute, tabBarItem2Attribute, tabBarItem3Attribute, tabBarItem4Attribute];
    
    return tarBarItemsAttrbutes;
}

@end
