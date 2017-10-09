//
//  AppDelegate.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/13.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "AppDelegate.h"
#import "FFTabBarController.h"
#import "DBManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configAppearance];
    [[DBManager sharedManager] createTable];
//    [[DBManager sharedManager] clearAll];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self rootViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)configAppearance {
    [[UINavigationBar appearance] setTintColor:[UIColor darkGrayColor]];
    [[UITabBar appearance] setTintColor:[UIColor darkGrayColor]];
}

- (UIViewController *)rootViewController {
    return [[FFTabBarController alloc] init];
}


@end
