//
//  Utils.m
//  众筹
//
//  Created by 邓超 on 15/9/22.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "Utils.h"
#import "Reachability.h"
#import <CommonCrypto/CommonDigest.h>
#import "KeychainItemWrapper.h"

@interface Utils ()<UIImagePickerControllerDelegate>
{
    
}

@end

@implementation Utils

/**
 *  初始化创建对象
 *
 *  @return Utils对象
 */
+ (instancetype)util
{
    Utils *util = [[Utils alloc] init];
    return util;
}

/**
 *  清除TableView的底部分割线
 *
 *  @param tableView 表示图
 */
+ (void)removeTheBottomLineWithTableView:(UITableView *)tableView
{
    UIView *currentView = [UIView new];
    currentView.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:currentView];
}

/**
 *  根据给定颜色创建纯色图片
 *
 *  @param color 颜色值
 *
 *  @return 纯色图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectZero;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  监测网络状态
 *
 *  @return 0 没有网络连接
 *          1 使用3G网络
 *          2 使用WiFi网络
 */
+ (NSInteger)checkNetState
{
    NSInteger value = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    return value;
}

/**
 *  字符串转换成MD5
 *
 *  @param string 字符串
 *
 *  @return MD5
 */
+ (NSString *)MD5StringWithString:(NSString *)string
{
    const char *cStr = [string UTF8String];
    
    unsigned char result[32];
    
    CC_MD5( cStr, strlen(cStr), result );
    
    return [NSString stringWithFormat:
            
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            
            result[0], result[1], result[2], result[3],
            
            result[4], result[5], result[6], result[7],
            
            result[8], result[9], result[10], result[11],
            
            result[12], result[13], result[14], result[15]
            
            ];
}

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
                         withWidth:(CGFloat)width
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font}  context:nil];
    return rect.size.height;
}

/**
 *  根据给定frame、color画虚线
 *
 *  @param frmae 位置
 *  @param color 颜色
 *
 *  @return 虚线
 */
+ (UIImageView *)createImaginaryLineWithFrame:(CGRect)frmae
                                    withColor:(UIColor *)color
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frmae];
    
    //开始画线
    UIGraphicsBeginImageContext(frmae.size);
    [imageView.image drawInRect:CGRectMake(0, 0, frmae.size.width, frmae.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    CGFloat lengths[] = {10, 5};
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, color.CGColor);
    
    //画虚线
    CGContextSetLineDash(line, frmae.origin.x, lengths, 2);
    //开始画线
    CGContextMoveToPoint(line, frmae.origin.x, frmae.size.height);
    CGContextAddLineToPoint(line, frmae.size.width, frmae.size.height);
    CGContextStrokePath(line);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    return imageView;
}

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
                      withAlpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    UIColor *currentColor = [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
    return currentColor;
}

/**
 *  json解析
 *
 *  @param data 网络请求数据
 *
 *  @return 字典
 */
+ (NSDictionary *)jsonDicWithJsonData:(NSData *)data
{
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //去除json数据中的异常字符
    jsonString = (__bridge NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)jsonString, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8);
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    return jsonDic;
}

/**
 *  json编码
 *
 *  @param dic 参数字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStringWith:(NSDictionary *)dic
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

/**
 *  验证身份证号
 *
 *  @param number 身份证号
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithIDCardNumber:(NSString *)number
{
    number = [number stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([number length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:number]) {
        return NO;
    }
    return YES;
}

/**
 *  验证手机号
 *
 *  @param number 手机号
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithPhoneNumber:(NSString *)number
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:number] == YES)
        || ([regextestcm evaluateWithObject:number] == YES)
        || ([regextestct evaluateWithObject:number] == YES)
        || ([regextestcu evaluateWithObject:number] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  验证邮箱
 *
 *  @param email 邮箱地址
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithEmail:(NSString *)email
{
    if((0 != [email rangeOfString:@"@"].length) &&
       
       (0 != [email rangeOfString:@"."].length))
    {
        NSCharacterSet* tmpInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        
        NSMutableCharacterSet *tmpInvalidMutableCharSet = [tmpInvalidCharSet mutableCopy];
        [tmpInvalidMutableCharSet removeCharactersInString:@"_-"];
        /*
         
         *使用compare option 来设定比较规则，如
         *NSCaseInsensitiveSearch是不区分大小写
         *NSLiteralSearch 进行完全比较,区分大小写
         *NSNumericSearch 只比较定符串的个数，而不比较字符串的字面值
         */
        NSRange range1 = [email rangeOfString:@"@"
                                      options:NSCaseInsensitiveSearch];
        //取得用户名部分
        NSString* userNameString = [email substringToIndex:range1.location];
        NSArray* userNameArray   = [userNameString componentsSeparatedByString:@"."];
        for(NSString* string in userNameArray)
        {
            NSRange rangeOfInavlidChars = [string rangeOfCharacterFromSet: tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length != 0 || [string isEqualToString:@""])
                return NO;
        }
        //取得域名部分
        NSString *domainString = [email substringFromIndex:range1.location+1];
        NSArray *domainArray   = [domainString componentsSeparatedByString:@"."];
        for(NSString *string in domainArray)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        return YES;
    }
    else {
        return NO;
    }
}

/**
 *  验证银行卡号
 *
 *  @param number 银行卡号
 *
 *  @return yes or no
 */
+ (BOOL)isCorrectWithBankCard:(NSString *)number
{
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = number.length - 1; i >= 0; i--) {
        digit = [number characterAtIndex:i] - '0';
        if (timesTwo) {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        } else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

/**
 *  APP是否第一次启动
 *
 *  @return yes or no
 */
+ (BOOL)isFirstLaunch
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if ([[userDefault objectForKey:@"isFirstLaunch"] isEqualToString:@"isFirstLaunch"]) {
        return NO;
    }
    
    [userDefault setObject:@"isFirstLaunch" forKey:@"isFirstLaunch"];
    return YES;
}

/**
 *  获取当前时空的UUID作为设备唯一识别码
 *
 *  @return UUID
 */
+ (NSString *)getUUID
{
    
    KeychainItemWrapper *keychainItemWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UUID" accessGroup:@"com.art.userInfo"];
    NSString *UUID = [keychainItemWrapper objectForKey:(id)kSecValueData];
    
    if (UUID != nil) {
        return UUID;
    }
    
    UUID = [UIDevice currentDevice].identifierForVendor.UUIDString;
    [keychainItemWrapper setObject:UUID forKey:(id)kSecValueData];
    return UUID;
}


@end
