//
//  JXVerticalFlowLayout.h
//  TestCollectionView
//
//  Created by JiongXing on 16/4/14.
//  Copyright © 2016年 LiangJiongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JXVerticalFlowLayoutDelegate;

@interface JXVerticalFlowLayout : UICollectionViewLayout

/// 代理
@property (nonatomic, assign) id<JXVerticalFlowLayoutDelegate> delegate;

/// header缩进
@property (nonatomic) UIEdgeInsets headerInset;

/// header高度
@property (nonatomic) CGFloat headerHeight;

/// 段内容缩进
@property (nonatomic) UIEdgeInsets sectionInset;

/// item与item水平间距
@property (nonatomic) CGFloat interItemSpacing;

/// 上下行间距
@property (nonatomic) CGFloat lineSpacing;

@end


@protocol JXVerticalFlowLayoutDelegate <NSObject>

/// 取特定项的size
- (CGSize)flowLayout:(JXVerticalFlowLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end