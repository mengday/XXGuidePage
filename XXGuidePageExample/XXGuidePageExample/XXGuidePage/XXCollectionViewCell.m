//
//  XXCollectionViewCell.m
//  iOSTest
//
//  Created by Macmini on 2017/1/12.
//  Copyright © 2017年 Macmini. All rights reserved.
//

#import "XXCollectionViewCell.h"

@interface XXCollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation XXCollectionViewCell

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}


- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:_imageView];
    }
    
    return _imageView;
}

@end
