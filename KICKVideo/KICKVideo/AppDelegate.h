//
//  AppDelegate.h
//  KICKVideo
//
//  Created by 杜 鹏 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    UITabBarController * tabBarController;
    NSTimer * startTimer;
}

@property (strong, nonatomic) UIWindow *window;

@end
