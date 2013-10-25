//
//  UICollectionViewWaterfallCell.m
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "CHTCollectionViewWaterfallCell.h"

@interface CHTCollectionViewWaterfallCell ()
@end

@implementation CHTCollectionViewWaterfallCell

#pragma mark - Accessors

- (UIView *) addCellView
{
    if (!_cellView) {
        _cellView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _cellView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _cellView.backgroundColor = [UIColor whiteColor];
    }
    
    [_cellView addSubview:self.addThumbnail];
    [_cellView addSubview:self.addPriceLabel];
    
    return _cellView;
}

- (UIImageView *)addThumbnail
{
    if (!_thumbnail) {
        _thumbnail = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _thumbnail.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _thumbnail.backgroundColor = [UIColor whiteColor];
    }
    
    return _thumbnail;
}

- (UILabel *)addPriceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 47, 23)];
        _priceLabel.text = @"0";
        _priceLabel.backgroundColor = [UIColor lightGrayColor];
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _priceLabel;
}

#pragma mark - Life Cycle
- (void)dealloc {
	[_cellView removeFromSuperview];
	_cellView = nil;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
        [self.contentView addSubview:self.addCellView];
        
	}
	return self;
}

@end
