//
//  AppDelegate.m
//  demo_imagecollection
//
//  Created by DangGu on 14-9-25.
//  Copyright (c) 2014年 DangGu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabbar,controllers;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.backgroundColor=[UIColor whiteColor];
    
    ImagesOne * imageone=[[ImagesOne alloc] init];
    UITabBarItem * oneitem=[[UITabBarItem alloc] initWithTitle:@"NSOperation" image:nil tag:001];
    UINavigationController * nav_one=[[UINavigationController alloc] initWithRootViewController:imageone];
    imageone.title=@"NSOperation";
    [nav_one setTabBarItem:oneitem];
    
    ImagesTwo * imagetwo=[[ImagesTwo alloc] init];
    UITabBarItem * twoitem=[[UITabBarItem alloc] initWithTitle:@"GCD" image:nil tag:002];
    UINavigationController * nav_two=[[UINavigationController alloc] initWithRootViewController:imagetwo];
    imagetwo.title=@"GCD";
    [nav_two setTabBarItem:twoitem];
    
    controllers=[NSArray arrayWithObjects:nav_one,nav_two, nil];
    tabbar=[[UITabBarController alloc] init];
    tabbar.delegate=self;
    tabbar.viewControllers=controllers;
    self.window.rootViewController=tabbar;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
