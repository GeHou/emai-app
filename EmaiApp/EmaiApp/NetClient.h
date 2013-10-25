//
//  NetClient.h
//  Emai
//
//  Created by emaidev on 13-10-14.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface NetClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
