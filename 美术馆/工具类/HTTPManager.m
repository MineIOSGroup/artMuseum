//
//  HTTPManager.m
//  众筹
//
//  Created by 邓超 on 15/10/26.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "HTTPManager.h"
#import "AFNetworking.h"
#import "Header.h"

@implementation HTTPManager

+(void)HTTPWithUrlPath:(NSString *)urlPath withParam:(NSDictionary *)paramDic withFinish:(void (^)(NSDictionary *data, NSError *error))blcok
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager POST:urlPath parameters:paramDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //成功
        NSLog(@"JSON:%@", responseObject);
        blcok(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败
        NSLog(@"ERROR:%@", error);
        blcok(nil, error);
    }];
}

@end
