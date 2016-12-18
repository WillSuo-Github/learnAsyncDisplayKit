//
//  WSASCollectionCell.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/12/18.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSASCollectionCell.h"
#import <ASImageNode.h>

@interface WSASCollectionCell ()

@property (nonatomic, weak) ASImageNode *myImageNode;
@end

@implementation WSASCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self configSubViews];
    }
    return self;
}


- (void)configSubViews{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        ASImageNode *node = [[ASImageNode alloc] init];
        node.frame = self.bounds;
        node.image = self.myImage;
        __weak typeof(self) weakSelf = self;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf.contentView addSubnode:node];
            weakSelf.myImageNode = node;
        }];
    }];
}

- (void)setMyImage:(UIImage *)myImage{
    _myImage = myImage;
    self.myImageNode.image = myImage;
}

@end
