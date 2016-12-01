//
//  WSCell.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/26.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSCell.h"
#import <CoreText/CoreText.h>

@interface WSCell ()

@property (nonatomic, strong) UILabel *myLabel;
@end

@implementation WSCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews{
    _myLabel = ({
        UILabel *label = [UILabel new];
        label.frame = self.bounds;
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:33];
        [self.contentView addSubview:label];
        label;
    });
}

- (void)setMyText:(NSMutableAttributedString *)myText{
    _myText = myText;
    self.myLabel.attributedText = myText;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.myLabel.frame = self.bounds;
}

@end
