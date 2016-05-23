//
//  Utils.h
//  众筹
//
//  Created by 邓超 on 15/9/22.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  工具类
 */
@interface Utils : NSObject

/**
 *  初始化创建对象
 *
 *  @return Utils对象
 */
+ (instancetype)util;

/**
 *  清除TableView的底部分割线
 *
 *  @param tableView 表示图
 */
+ (void)removeTheBottomLineWithTableView:(UITableView *)tableView;

/**
 *  根据给定颜色创建纯色图片
 *
 *  @param color 颜色值
 *
 *  @return 纯色图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 *  监测网络状态
 *
 *  @return 0 没有网络连接
 *          1 使用3G网络
 *          2 使用WiFi网络
 */
+ (NSInteger)checkNetState;

/**
 *  字符串转换成MD5
 *
 *  @param string 字符串
 *
 *  @return MD5
 */
+ (NSString *)MD5StringWithString:(NSString *)string;

/**
 *  根据文本内容、字体大小、以及视图宽度
 *  返回视图高度
 *
 *  @param text  文本内容
 *  @param font  字体大小
 *  @param width 视图宽度
 *
 *  @return 视图高度
 */
+ (CGFloat)returnHeightWithContent:(NSString *)text
                          withFont:(UIFont *)font
                         withWidth:(CGFloat)width;


/**
 *  根据给定frame、color画虚线
 *
 *  @param frmae 位置
 *  @param color 颜色
 *
 *  @return 虚线
 */
+ (UIImageView *)createImaginaryLineWithFrame:(CGRect)frmae
                                    withColor:(UIColor *)color;

/**
 *  根据十六进制字符串、透明度获取颜色
 *  color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @param color 十六进制字符串
 *  @param alpha 0 ~ 1.0 表示透明度
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color
                          withAlpha:(CGFloat)alpha;

/**
 *  json解析
 *
 *  @param data 网络请求数据
 *
 *  @return 字典
 */
+ (NSDictionary *)jsonDicWithJsonData:(NSData *)data;

/**
 *  json编码
 *
 *  @param dic 参数字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStringWith:(NSDictionary *)dic;

/**
 *  验证身份证号
 *
 *  @param number 身份证号
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithIDCardNumber:(NSString *)number;

/**
 *  验证手机号
 *
 *  @param number 手机号
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithPhoneNumber:(NSString *)number;

/**
 *  验证邮箱
 *
 *  @param email 邮箱地址
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithEmail:(NSString *)email;

/**
 *  验证银行卡号
 *
 *  @param number 银行卡号
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithBankCard:(NSString *)number;

/**
 *  APP是否第一次启动
 *
 *  @return yes or no
 */
+ (BOOL)isFirstLaunch;

/**
 *  获得UUID
 *
 *  @return UUID
 */
+ (NSString *)getUUID;

@end
