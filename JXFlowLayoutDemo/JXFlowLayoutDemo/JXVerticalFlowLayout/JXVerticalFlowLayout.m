//
//  JXVerticalFlowLayout.m
//  TestCollectionView
//
//  Created by JiongXing on 16/4/14.
//  Copyright © 2016年 LiangJiongXing. All rights reserved.
//

#import "JXVerticalFlowLayout.h"

@implementation JXVerticalFlowLayout
{
    NSMutableArray<UICollectionViewLayoutAttributes *> *_attributeArray;
    CGFloat _contentHeight;
}

- (void)prepareLayout
{
    [super prepareLayout];
    NSAssert(self.delegate && [self.delegate respondsToSelector:@selector(flowLayout:sizeForItemAtIndexPath:)], @"必须实现JXVerticalFlowLayout的代理方法flowLayout:sizeForItemAtIndexPath:");
    
    _attributeArray = [NSMutableArray array];
    
    CGFloat nextY = 0;
    CGFloat collectionWidth = CGRectGetWidth(self.collectionView.bounds);
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    
    for (NSInteger sectionIndex = 0; sectionIndex < numberOfSections; sectionIndex ++) {
        
        // header
        NSIndexPath *sectionPath = [NSIndexPath indexPathForItem:0 inSection:sectionIndex];
        UICollectionViewLayoutAttributes *headerAttr = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:sectionPath];
        CGFloat headerY = sectionIndex == 0 ? nextY : nextY + _headerInset.top;
        headerAttr.frame = CGRectMake(_headerInset.left, headerY, collectionWidth - _headerInset.left - _headerInset.right, _headerHeight);
        [_attributeArray addObject:headerAttr];
        nextY = CGRectGetMaxY(headerAttr.frame) + _headerInset.bottom;
        
        // item
        nextY += _sectionInset.top;
        CGFloat nextItemX = _sectionInset.left;
        CGFloat maxRowHeight = 0;
        
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:sectionIndex];
        for (NSInteger itemIndex = 0; itemIndex < numberOfItems; itemIndex ++) {
            
            NSIndexPath *path = [NSIndexPath indexPathForItem:itemIndex inSection:sectionIndex];
            CGSize itemSize = [self.delegate flowLayout:self sizeForItemAtIndexPath:path];
            maxRowHeight = MAX(maxRowHeight, itemSize.height);
            
            // 如果此item的宽度超出一行所容纳的宽度，则强制修改此item宽度为行宽
            itemSize.width = MIN(itemSize.width, collectionWidth - _sectionInset.left - _sectionInset.right);
            
            // 换行判断
            if (nextItemX + itemSize.width + _sectionInset.right > collectionWidth) {
                nextItemX = _sectionInset.left;
                nextY += maxRowHeight;
                nextY += _lineSpacing;
                maxRowHeight = itemSize.height;
            }
            
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
            attr.frame = CGRectMake(nextItemX, nextY, itemSize.width, itemSize.height);
            [_attributeArray addObject:attr];
            
            // 下一项
            nextItemX = CGRectGetMaxX(attr.frame) + _interItemSpacing;
        }
        nextY += maxRowHeight;
        nextY += _sectionInset.bottom;
    }
    _contentHeight = nextY;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.bounds), _contentHeight);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attributeArray;
}

@end
