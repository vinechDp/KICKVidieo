//
//  AppDelegate.m
//  KICKVideo
//
//  Created by 杜 鹏 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "VideoListViewController.h"
#import "DetailVideoViewController.h"
#import "MoreViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [tabBarController release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    NSString * startImageString = [NSString stringWithFormat:@"%@/Default.png",[[NSBundle mainBundle] resourcePath]];
    UIImage * startImage = [UIImage imageWithContentsOfFile:startImageString];
    UIImageView * startImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    startImageView.image = startImage;
    startImageView.tag = 1000;
    [self.window.rootViewController.view addSubview:startImageView];
    
    //------------------计时器---------------------
    startTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(startScreen) userInfo:nil repeats:NO];
    
    //初始化一个可变的数组存放一系列的controller.
    NSMutableArray *controllrsArray = [[NSMutableArray alloc] initWithCapacity:10];
    
    VideoListViewController * videoListVC = [[VideoListViewController alloc] init];
    UINavigationController * videoListNavC = [[UINavigationController alloc] initWithRootViewController:videoListVC];
    videoListNavC.tabBarItem.title = @"Video";
    [controllrsArray addObject:videoListNavC];
    [videoListVC release];
    [videoListNavC release];
    
    DetailVideoViewController * detailVC = [[DetailVideoViewController alloc] init];
    UINavigationController * detailNavC = [[UINavigationController alloc] initWithRootViewController:detailVC];
    detailNavC.tabBarItem.title = @"Detail";
    [controllrsArray addObject:detailNavC];
    [detailVC release];
    [detailNavC release];
    
    MoreViewController * moreVC = [[MoreViewController alloc] init];
    UINavigationController * moreNavC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    moreNavC.tabBarItem.title = @"More";
    [controllrsArray addObject:moreNavC];
    [moreVC release];
    [moreNavC release];

    tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = controllrsArray;
    tabBarController.delegate = self;
    
    [controllrsArray release];//及时的释放。

    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)startScreen
{
    static int time = 0;
    time++;
    if (time == 3) {
        UIImageView * imageView = (UIImageView *)[self.window viewWithTag:1000];
        [imageView removeFromSuperview];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
