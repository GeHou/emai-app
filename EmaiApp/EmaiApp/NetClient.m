//
//  NetClient.m
//  Emai
//
//  Created by emaidev on 13-10-14.
//  Copyright (c) 2013年 hou. All rights reserved.
//

#import "NetClient.h"

@implementation NetClient

static NSString * const APIBaseURLString = @"http://mservice.emai.com/";

+ (instancetype)sharedClient
{
    static NetClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NetClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });
    
    return _sharedClient;
}

@end
