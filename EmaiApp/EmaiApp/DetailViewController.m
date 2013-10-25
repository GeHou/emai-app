//
//  ,
//  Emai
//
//  Created by emaidev on 13-10-17.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize good, titleLabel, priceLabel, thumbnailImageView, seller;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"宝贝详情"];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
        [n setBackBarButtonItem:backButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    titleLabel.text = [good valueForKeyPath:@"title"];
    priceLabel.text = [@"¥" stringByAppendingString:[good valueForKeyPath:@"price"]];
    seller.text = [good valueForKeyPath:@"seller_name"];
    NSURL *imgUrl = [NSURL URLWithString:[good valueForKeyPath:@"image"]];
    [thumbnailImageView setImageWithURL:imgUrl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpToWeb:(id)sender
{
    WebViewController *webViewController = [[WebViewController alloc] init];
    
    [webViewController setFanliUrl:[NSURL URLWithString:[good valueForKeyPath:@"fanli_url"]]];
    
    [[self navigationController] pushViewController:webViewController animated:YES];
}

@end
