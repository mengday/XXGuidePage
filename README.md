# XXGuidePage

一个快速集成引导页功能的封装

---
## Getting Started【开始使用】

1. 将XXGuidePage文件夹拖入到自己的工程中
2. 在AppDelegate中application:didFinishLaunchingWithOptions:方法中调用 showGuidePageWithImages:rootViewController: 方法即可集成引导页功能


---
## Integration Examples【集成示例】

示例1：(使用系统默认属性)
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *viewController = [[UITabBarController alloc] init];


    self.window.rootViewController = [[[XXGuidePageViewController alloc] init] showGuidePageWithImages:@[@"guide-page-1", @"guide-page-2", @"guide-page-3", @"guide-page-4"] rootViewController:viewController];
    return YES;
}
```


示例2：(可以对UIPageControl和UIButton做更多的属性设置)

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *viewController = [[UITabBarController alloc] init];

    XXGuidePageViewController *guidePageViewController = [[XXGuidePageViewController alloc] init];
    guidePageViewController.pageControl.pageIndicatorTintColor = [UIColor redColor];
    guidePageViewController.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [guidePageViewController.startAppButton setTitle:@"马上体验" forState:UIControlStateNormal];

    UIViewController *rootViewController = [guidePageViewController showGuidePageWithImages:@[@"guide-page-1", @"guide-page-2", @"guide-page-3", @"guide-page-4"] rootViewController:viewController];

    self.window.rootViewController = rootViewController;

    return YES;
}
```


