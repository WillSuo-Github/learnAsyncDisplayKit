//
//  ASViewController.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/27.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSASViewController.h"
#import "WSCell.h"
#import <CoreText/CoreText.h>
#import "WSASTableViewCell.h"

@interface WSASViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *sourceArr;

@end

@implementation WSASViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubViews];
    
    [self configDataSoucre];
}

- (void)setUpSubViews{
    
    self.myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [tableView registerClass:NSClassFromString(@"WSASTableViewCell") forCellReuseIdentifier:@"WSASTableViewCell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView;
    });
}

- (void)configDataSoucre{
    self.sourceArr = [NSMutableArray array];
    for (int i = 0; i < 1000; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d %@",i ,@"Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫"];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
        [attStr addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, attStr.length)];
        [attStr addAttribute:(id)kCTStrokeColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, attStr.length)];
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, attStr.length)];
        [attStr addAttribute:NSStrokeWidthAttributeName value:@(-3) range:NSMakeRange(0, attStr.length)];
        [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0, attStr.length)];
        [self.sourceArr addObject:attStr];
    }
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WSASTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WSASTableViewCell"];
    cell.myText = self.sourceArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 38;
}


@end
