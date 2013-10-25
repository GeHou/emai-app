//
//  UICollectionViewWaterfallCell.h
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTCollectionViewWaterfallCell : UICollectionViewCell
@property (nonatomic, copy) NSString *displayString;
@property (nonatomic, strong) UILabel *displayLabel;
@property (nonatomic, strong) UICollectionViewCell *cell;
@property (nonatomic, strong) UIImageView *thumbnail;
@property (nonatomic, strong) UILabel *priceLabel;

@end
