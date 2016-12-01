//
//  WSCollectionViewCell.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/27.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSCollectionViewCell.h"

@interface WSCollectionViewCell ()

@property (nonatomic, strong) UIImageView *myImageView;
@end

@implementation WSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews{
    self.myImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:self.myImageView];
}

- (void)setMyImage:(UIImage *)myImage{
    _myImage = myImage;
    
    [self.myImageView setImage:myImage];
}

@end
