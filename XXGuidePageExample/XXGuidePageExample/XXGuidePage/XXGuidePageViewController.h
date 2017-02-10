//
//  GuidePageViewController.h
//  XXDateViewExample
//
//  Created by Macmini on 2017/2/9.
//  Copyright © 2017年 Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXGuidePageViewController : UIViewController

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *startAppButton;


- (UIViewController *)showGuidePageWithImages:(NSArray *)images rootViewController:(UIViewController *)rootViewController;

@end
