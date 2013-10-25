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
- (UILabel *)displayLabel {
	if (!_displayLabel) {
		_displayLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
		_displayLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_displayLabel.backgroundColor = [UIColor lightGrayColor];
		_displayLabel.textColor = [UIColor whiteColor];
		_displayLabel.textAlignment = NSTextAlignmentCenter;
	}
	return _displayLabel;
}

- (void)setDisplayString:(NSString *)displayString {
	if (![_displayString isEqualToString:displayString]) {
		_displayString = [displayString copy];
		self.displayLabel.text = _displayString;
	}
}

- (UICollectionViewCell *)displayCell
{
    if (!_cell) {
        _cell = [[UICollectionViewCell alloc] initWithFrame:self.contentView.bounds];
        _cell.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _cell.backgroundColor = [UIColor lightGrayColor];
    }
//    [_cell.contentView addSubview:self.addThumbnail];
//    [_cell.contentView addSubview:self.addPriceLabel];
    return _cell;
}

- (UIImageView *)addThumbnail
{
    if (!_thumbnail) {
        _thumbnail = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _thumbnail.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _thumbnail.backgroundColor = [UIColor whiteColor];
        _thumbnail.image = [UIImage imageNamed:@"NiuPai.jpg"];
    }
    
    return _thumbnail;
}

- (UILabel *)addPriceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        _priceLabel.text = @"100";
        _priceLabel.backgroundColor = [UIColor lightGrayColor];
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _priceLabel;
}

#pragma mark - Life Cycle
- (void)dealloc {
	[_cell removeFromSuperview];
	_cell = nil;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		[self.contentView addSubview:self.displayLabel];
        [self.contentView addSubview:self.displayCell];
	}
	return self;
}

@end
