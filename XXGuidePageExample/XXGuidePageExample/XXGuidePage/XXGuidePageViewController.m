//
//  GuidePageViewController.m
//  XXDateViewExample
//
//  Created by Macmini on 2017/2/9.
//  Copyright © 2017年 Macmini. All rights reserved.
//

#import "XXGuidePageViewController.h"
#import "XXCollectionViewCell.h"

#define kVersionKey @"AppVersion"
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

NSString *const Cell = @"CELL";
@interface XXGuidePageViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation XXGuidePageViewController


- (UIViewController *)showGuidePageWithImages:(NSArray *)images rootViewController:(UIViewController *)rootViewController {
    self.images = images;
    _rootViewController = rootViewController;
    
    return [self isShowGuidePage] ? self : rootViewController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UICollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor greenColor];
    [collectionView registerClass:[XXCollectionViewCell class] forCellWithReuseIdentifier:Cell];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    [self.view addSubview:collectionView];
    
    
    // UIPageControl（分页）
    [self.view addSubview:self.pageControl];
    
    
    // UIButton（立即体验）
    [self.view addSubview:self.startAppButton];
    
}


-(UIPageControl *)pageControl {
    if (_pageControl == nil) {
        UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth - 100) / 2, kScreenHeight- 50, 100, 30)];
        pageControl.numberOfPages = self.images.count;
        pageControl.currentPage = 0;
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        
        _pageControl = pageControl;
    }
    
    return _pageControl;
}

- (UIButton *)startAppButton {
    if (_startAppButton == nil) {
        UIButton *startAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat height = 30;
        startAppButton.frame = CGRectMake((kScreenWidth - 100) / 2, 550, 100, height);
        [startAppButton setTitle:@"立即体验" forState:UIControlStateNormal];
        
        UIColor *themeColor = [UIColor blueColor];
        
        [startAppButton setTitleColor:themeColor forState:UIControlStateNormal];
        startAppButton.layer.borderWidth = 1;
        startAppButton.layer.borderColor = themeColor.CGColor;
        
        startAppButton.layer.cornerRadius = height / 2;
        startAppButton.layer.masksToBounds = YES;
        
        [startAppButton addTarget:self action:@selector(startAppAction) forControlEvents:UIControlEventTouchUpInside];
        startAppButton.hidden = YES;
        _startAppButton = startAppButton;
    }
    
    return _startAppButton;
}


- (void)setImages:(NSArray *)images {
    _images = images;
    
    self.pageControl.numberOfPages = images.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cell forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:self.images[indexPath.row]];
    
    return cell;
}



- (BOOL)isShowGuidePage {
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kVersionKey];
    
    if (![currentVersion isEqualToString:lastVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:kVersionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        return true;
    }
    
    return false;
}


- (void)startAppAction {
    // 根视图控制器一般是UITabBarController,这里简单实现
    [UIApplication sharedApplication].keyWindow.rootViewController = self.rootViewController;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / kScreenWidth;
    self.pageControl.currentPage = currentPage;
    if (currentPage == (self.images.count - 1)) {
        self.startAppButton.hidden = NO;
    } else {
        self.startAppButton.hidden = YES;
    }
}
@end
