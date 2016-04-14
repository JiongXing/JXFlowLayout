//
//  ViewController.m
//  JXFlowLayoutDemo
//
//  Created by JiongXing on 16/4/14.
//  Copyright © 2016年 LiangJiongXing. All rights reserved.
//

#import "ViewController.h"
#import "JXVerticalFlowLayout.h"
#import "CollectionReusableView.h"
#import "CollectionViewCell.h"

@interface ViewController () <JXVerticalFlowLayoutDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JXVerticalFlowLayout *layout = [[JXVerticalFlowLayout alloc] init];
    layout.headerHeight = 40;
    layout.headerInset = UIEdgeInsetsMake(10, 15, 10, 15);
    layout.interItemSpacing = 20;
    layout.lineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:[CollectionViewCell defaultID]];
    [collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionReusableView defaultID]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

//每个section中有32个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionViewCell defaultID] forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%@",@(indexPath.item)];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionReusableView defaultID] forIndexPath:indexPath];
    view.label.text = [NSString stringWithFormat:@"Section Header %@",@(indexPath.section + 1)];
    return view;
}

- (CGSize)flowLayout:(JXVerticalFlowLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(arc4random_uniform(80) + 40, arc4random_uniform(30) + 20);
}



@end
