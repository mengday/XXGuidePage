//
//  AppDelegate.m
//  XXGuidePageExample
//
//  Created by Macmini on 2017/2/9.
//  Copyright © 2017年 Macmini. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "XXGuidePageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *viewController = [[UITabBarController alloc] init];
    
//    XXGuidePageViewController *guidePageViewController = [[XXGuidePageViewController alloc] init];
//    guidePageViewController.pageControl.pageIndicatorTintColor = [UIColor redColor];
//    guidePageViewController.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
//    [guidePageViewController.startAppButton setTitle:@"马上体验" forState:UIControlStateNormal];
//
//    UIViewController *rootViewController = [guidePageViewController showGuidePageWithImages:@[@"guide-page-1", @"guide-page-2", @"guide-page-3", @"guide-page-4"] rootViewController:viewController];
//    
//    self.window.rootViewController = rootViewController;
    
    self.window.rootViewController = [[[XXGuidePageViewController alloc] init] showGuidePageWithImages:@[@"guide-page-1", @"guide-page-2", @"guide-page-4", @"guide-page-3"] rootViewController:viewController];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
