//
//  YouhuiViewController.m
//  Emai
//
//  Created by emaidev on 13-10-15.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import "YouhuiViewController.h"

@interface YouhuiViewController ()

@end

@implementation YouhuiViewController
{
    NSMutableArray *tableData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"聚优惠"];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
        [n setBackBarButtonItem:backButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [activityIndicator startAnimating];
    
    [[NetClient sharedClient] GET:@"android/getyouhuigoods" parameters:nil success:^(NSURLSessionDataTask * __unused task, id data) {
        
        NSArray *allGoods = [data valueForKeyPath:@"goodsInfo"];
        
        tableData = [[NSMutableArray alloc] init];
        
        for (NSArray *good in allGoods) {
            [tableData addObject:good];
        }
        
        [activityIndicator stopAnimating];
        [listTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        UIAlertView *errorNoticeAlert = [[UIAlertView alloc] initWithTitle:@"发成错误" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [errorNoticeAlert show];
        [activityIndicator stopAnimating];
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"YouhuiTableCell";
    
    YouhuiTableCell *cell = (YouhuiTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YouhuiTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.titleLabel.text = [[tableData objectAtIndex:indexPath.row] valueForKeyPath:@"title"];
    cell.priceLabel.text = [@"¥" stringByAppendingString:[[tableData objectAtIndex:indexPath.row] valueForKeyPath:@"price"]];
    cell.seller.text = [[tableData objectAtIndex:indexPath.row] valueForKeyPath:@"seller_name"];
    NSURL *imgUrl = [NSURL URLWithString:[[tableData objectAtIndex:indexPath.row] valueForKeyPath:@"image"]];
    [cell.thumbnailImageView setImageWithURL:imgUrl];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    [detailViewController setGood:[tableData objectAtIndex:indexPath.row]];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

@end
