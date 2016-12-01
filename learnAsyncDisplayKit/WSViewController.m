//
//  NormalViewController.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/19.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSViewController.h"
#import "WSCell.h"
#import <CoreText/CoreText.h>
#import "WSASViewController.h"

@interface WSViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *sourceArr;

@end

@implementation WSViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpSubViews];
    
    [self configDataSoucre];
}

- (void)setUpSubViews{
    
    self.myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [tableView registerClass:NSClassFromString(@"WSCell") forCellReuseIdentifier:@"WSCell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView;
    });
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"toASview" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonChick)];
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

- (void)rightBarButtonChick{
    
    WSASViewController *asVc = [[WSASViewController alloc] init];
    [self.navigationController pushViewController:asVc animated:true];
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WSCell"];
    cell.myText = self.sourceArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 38;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
