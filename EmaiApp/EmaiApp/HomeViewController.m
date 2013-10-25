//
//  HomeViewController.m
//  Emai
//
//  Created by emaidev on 13-10-14.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSMutableArray *grids;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"亿买购物"];
        // 去除导航返回按钮的文字
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
        [n setBackBarButtonItem:backButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _grids = [[NSMutableArray alloc] init];
    [_grids addObject:@"grid1.png"];
    [_grids addObject:@"grid2.png"];
    [_grids addObject:@"grid3.png"];
    

    UINib *cellNib = [UINib nibWithNibName:@"HomeCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"gridCell"];
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setItemSize:CGSizeMake(90, 90)];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    [flowLayout setSectionInset:UIEdgeInsetsMake(10, 10, 0, 0)];

//    [self.collectionView setCollectionViewLayout:flowLayout];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gridCell" forIndexPath:indexPath];
    UIImageView *gridIcon = (UIImageView *)[cell viewWithTag:10];
    gridIcon.image = [UIImage imageNamed:[_grids objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YouhuiViewController *youhuiViewController = [[YouhuiViewController alloc] init];
    ShareViewController *shareViewController = [[ShareViewController alloc] init];
    switch (indexPath.row) {
        case 0:
            [[self navigationController] pushViewController:youhuiViewController animated:YES];
            break;
        
        case 1:
            [[self navigationController] pushViewController:shareViewController animated:YES];
            break;
            
        case 2:
            [[self navigationController] pushViewController:shareViewController animated:YES];
            break;
            
        default:
            break;
    }
}

@end
