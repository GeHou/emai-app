//
//  WebViewController.h
//  Emai
//
//  Created by emaidev on 13-10-18.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSURL *fanliUrl;

@end
