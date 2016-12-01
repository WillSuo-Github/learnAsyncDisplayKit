//
//  ViewController.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/11/27.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "ViewController.h"
#import "WSCollectionViewController.h"
#import "WSASViewController.h"
#import "WSViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, copy) NSArray *sourceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubViews];
    
    [self configDataSoucre];
}

- (void)setUpSubViews{
    
    self.myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView;
    });

}

- (void)configDataSoucre{
    self.sourceArr = @[@"Normal TVC", @"AS TVC", @"Normal CVC", @"AS CVC"];
}


#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            WSViewController *wsVc = [[WSViewController alloc] init];
            [self.navigationController pushViewController:wsVc animated:true];
        }
            break;
        case 1:
        {
            WSASViewController *wsAsVc = [[WSASViewController alloc] init];
            [self.navigationController pushViewController:wsAsVc animated:true];
        }
            break;
        case 2:
        {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            WSCollectionViewController *wsCVc = [[WSCollectionViewController alloc] initWithCollectionViewLayout:layout];
            [self.navigationController pushViewController:wsCVc animated:true];
        }
            break;
        case 3:
        {
            WSViewController *wsVc = [[WSViewController alloc] init];
            [self.navigationController pushViewController:wsVc animated:true];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.sourceArr[indexPath.row];
    return cell;
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
