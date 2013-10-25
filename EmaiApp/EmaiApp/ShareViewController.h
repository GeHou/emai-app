//
//  ViewController.h
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetClient.h"
#import "UIImageView+AFNetworking.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "DetailViewController.h"

@interface ShareViewController : UIViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>
@property (nonatomic, strong) UICollectionView *shareCollectionView;
@property (nonatomic) CGFloat cellWidth;

@end
