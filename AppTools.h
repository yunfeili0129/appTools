//
//  AppTools.h
//  Created by liyunfei on 16/7/22.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <zconf.h>
@interface AppTools : NSObject
+(NSString*)dictionaryToJson:(NSDictionary *)dic;
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+(NSString *)ToHex:(uLong)tmpid;
+(NSString *)decimalTOBinary:(uint16_t)tmpid backLength:(int)length;
+(NSString *)stringFromDate:(NSDate *)date;
+(NSDate *)dateFromString:(NSString *)string;
+(NSArray *)systemInfo;
+(NSArray *)randomArray;
+ (NSString *)uuidString;
+(NSString *)getTimeNow;
@end
