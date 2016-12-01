//
//  WSASTableViewCell.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/27.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSASTableViewCell.h"
#import <AsyncDisplayKit.h>

@interface WSASTableViewCell ()

@property (nonatomic, strong) ASTextNode *textNode;
@end

@implementation WSASTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        ASTextNode *textNode = [[ASTextNode alloc] init];
        textNode.frame = self.bounds;
        textNode.attributedText = self.myText;
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.contentView addSubview:textNode.view];
            weakSelf.textNode = textNode;
        });
    }];
}

- (void)setMyText:(NSMutableAttributedString *)myText{
    _myText = myText;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        weakSelf.textNode.attributedText = myText;
    });
}


@end
