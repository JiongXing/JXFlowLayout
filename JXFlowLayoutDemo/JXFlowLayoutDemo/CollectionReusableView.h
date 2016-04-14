//
//  CollectionReusableView.h
//  JXFlowLayoutDemo
//
//  Created by JiongXing on 16/4/14.
//  Copyright © 2016年 LiangJiongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionReusableView : UICollectionReusableView

@property (nonatomic, strong) UILabel *label;

+ (NSString *)defaultID;

@end
