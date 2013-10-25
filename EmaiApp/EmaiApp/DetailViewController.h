//
//  YouhuiDetailViewController.h
//  Emai
//
//  Created by emaidev on 13-10-17.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"
#import "WebViewController.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSArray *good;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *seller;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

- (IBAction)jumpToWeb:(id)sender;

@end
