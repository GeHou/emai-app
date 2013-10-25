//
//  HomeViewController.h
//  Emai
//
//  Created by emaidev on 13-10-14.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouhuiViewController.h"
#import "ShareViewController.h"

@interface HomeViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
