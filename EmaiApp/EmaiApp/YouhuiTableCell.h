//
//  YouhuiTableCell.h
//  Emai
//
//  Created by emaidev on 13-10-15.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YouhuiTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *seller;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
