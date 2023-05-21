//
//  AppTools.h
//  Created by liyunfei on 16/7/22.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <zconf.h>
@interface AppTools : NSObject
//字典转json字符串
+(NSString*)dictionaryToJson:(NSDictionary *)dic;
//字符串转字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//十进制转化为16进制
+(NSString *)ToHex:(uLong)tmpid;
//二进制转化为16进制
+(NSString *)decimalTOBinary:(uint16_t)tmpid backLength:(int)length;
//将16进制转化为二进制
-(NSString *)getBinaryByhex:(NSString *)hex;
//日期转字符串
+(NSString *)stringFromDate:(NSDate *)date;
//字符串转日期
+(NSDate *)dateFromString:(NSString *)string;
//获取系统相关信息
+(NSArray *)systemInfo;
//字符串转换为nsurl
+ (NSURL *)smartURLForString:(NSString *)str;
//判断url是否可用
+(void) validateUrl: (NSURL *) candidate callBlock:(callBlock)block;
//随机生成uuid
+ (NSString *)uuidString;
//获取当前时间，精确到毫秒
+(NSString *)getTimeNow;
//听筒模式
+(void)setAudioSession;
//扬声器模式
+(void)setAudioWaiFangSession
@end
