//
//  YouhuiTableCell.m
//  Emai
//
//  Created by emaidev on 13-10-15.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import "YouhuiTableCell.h"

@implementation YouhuiTableCell

@synthesize titleLabel, priceLabel, thumbnailImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
