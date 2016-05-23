//
//  HTTPManager.h
//  众筹
//
//  Created by 邓超 on 15/10/26.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  网络管理工具类
 */
@interface HTTPManager : NSObject

/**
 *  Post网络请求
 *
 *  @param urlPath  urlPath
 *  @param paramDic 参数字典
 *  @param blcok    网络请求返回数据
 */
+ (void)HTTPWithUrlPath:(NSString *)urlPath
              withParam:(NSDictionary *)paramDic
             withFinish:(void (^)(NSDictionary *data, NSError *error))blcok;

@end
