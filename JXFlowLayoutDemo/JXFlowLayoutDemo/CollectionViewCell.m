//
//  CollectionViewCell.m
//  JXFlowLayoutDemo
//
//  Created by JiongXing on 16/4/14.
//  Copyright © 2016年 LiangJiongXing. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:label];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.label = label;
        
        self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.contentView.layer.borderWidth = 0.5;
    }
    return self;
}

+ (NSString *)defaultID
{
    return NSStringFromClass([self class]);
}

@end
