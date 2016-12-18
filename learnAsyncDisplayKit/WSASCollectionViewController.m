//
//  WSASCollectionViewController.m
//  learnAsyncDisplayKit
//
//  Created by ws on 2016/12/7.
//  Copyright © 2016年 WS. All rights reserved.
//

#import "WSASCollectionViewController.h"
#import "WSASCollectionCell.h"

@interface WSASCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *sourceArr;
@end

@implementation WSASCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[WSASCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self configSourceArr];
}


- (void)configSourceArr {
    
    self.sourceArr = [NSMutableArray array];
    for (int i = 0; i < 20000; i ++) {
        NSInteger j = i % 20;
        NSString *imageName = [NSString stringWithFormat:@"%ld",j];
        [self.sourceArr addObject:[UIImage imageNamed:imageName]];
    }
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.sourceArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WSASCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.myImage = self.sourceArr[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


#pragma mark <UICollectionViewDelegate>


#pragma mark -
#pragma mark - dealloc
- (void)dealloc{
    NSLog(@"as collection dealloc");
}

@end
