//
//  YouhuiViewController.h
//  Emai
//
//  Created by emaidev on 13-10-15.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetClient.h"
#import "UIImageView+AFNetworking.h"
#import "YouhuiTableCell.h"
#import "DetailViewController.h"

@interface YouhuiViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    __weak IBOutlet UITableView *listTableView;
}
@end
