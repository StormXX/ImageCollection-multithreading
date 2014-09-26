//
//  AppDelegate.h
//  demo_imagecollection
//
//  Created by DangGu on 14-9-25.
//  Copyright (c) 2014年 DangGu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesOne.h"
#import "ImagesTwo.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController * tabbar;
@property (strong, nonatomic) NSArray * controllers;
@end

