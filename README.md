# JXFlowLayout
##UICollectionView的一个流式布局
###由于UICollectionViewFlowLayout在同一行时会把元素作两端对齐，故我写了一个非对齐的布局
```objc
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
```
![snapshot](https://raw.githubusercontent.com/JiongXing/JXFlowLayout/master/pictures/1.png)
===
### 如果能帮到您，给颗星星吧 ^_^
