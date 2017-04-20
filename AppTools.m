//
//  AppTools.m
//  Created by liyunfei on 16/7/22.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import "AppTools.h"
#import "SBJson.h"
#import <AVFoundation/AVFoundation.h>
typedef void(^callBlock)(BOOL isOk);
@implementation AppTools
//日期转换为字符串
+(NSArray *)systemInfo
{
//    NSLog(@"name: %@", [[UIDevice currentDevice] name]);
//    NSLog(@"systemName: %@", [[UIDevice currentDevice] systemName]);
//    NSLog(@"systemVersion: %@", [[UIDevice currentDevice] systemVersion]);
//    NSLog(@"model: %@", [[UIDevice currentDevice] model]);
//    NSLog(@"localizedModel: %@", [[UIDevice currentDevice] localizedModel]);
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //CFShow(infoDictionary);
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    // app版本
    NSString *app_Version =[infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // app build版本
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSArray *arr=[NSArray arrayWithObjects:app_Name,app_Version,app_build, nil];
    return arr;

}
//日期转换字符串
+ (NSString *)stringFromDate:(NSDate *)date
{
    //获取系统当前时间
    NSDate *currentDate = date;
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    NSLog(@"%@",currentDateString);
    return currentDateString;
}

//字符串转日期
+ (NSDate *)dateFromString:(NSString *)string
{
    //需要转换的字符串
    NSString *dateString = string;
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:dateString];
    return date;
}
//字典转换为字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    if (dic)
    {
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    else
    {
       return @" ";
    }
    
}
//字符串转化为字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    jsonString = [jsonString stringByReplacingOccurrencesOfString : @"\r\n" withString : @"" ];
    jsonString = [jsonString stringByReplacingOccurrencesOfString : @"\n" withString : @"" ];
    jsonString = [jsonString stringByReplacingOccurrencesOfString : @"\t" withString : @"" ];
    jsonString = [jsonString stringByReplacingOccurrencesOfString : @"\\" withString : @""];
    //采用第三方库傻逼json，用原生库无法正确解析
    SBJsonParser *parser =[[ SBJsonParser alloc ] init ];
    
    //id returnObject = [parser objectWithString : jsonString ];
     //NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",jsonData);
    //NSError *err;
    //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    NSMutableDictionary *dicMessageInfo = [parser objectWithString:jsonString];
//    if(err) {
//             return nil;
//        }
    return dicMessageInfo;
}
//十进制转化为16进制
+(NSString *)ToHex:(uLong)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    long long int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%lli",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;  
        }  
        
    }  
    return str;  
}
//二进制转化为16进制
+ (NSString *)decimalTOBinary:(uint16_t)tmpid backLength:(int)length
{
    NSString *a = @"";
    while (tmpid)
    {
        a = [[NSString stringWithFormat:@"%d",tmpid%2] stringByAppendingString:a];
        if (tmpid/2 < 1)
        {
            break;
        }
        tmpid = tmpid/2 ;
    }
    
    if (a.length <= length)
    {
        NSMutableString *b = [[NSMutableString alloc]init];;
        for (int i = 0; i < length - a.length; i++)
        {
            [b appendString:@"0"];
        }
        
        a = [b stringByAppendingString:a];
        [b release];
    }
    
    return a;
    
}
//将16进制转化为二进制
-(NSString *)getBinaryByhex:(NSString *)hex
{
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    
    [hexDic setObject:@"0000" forKey:@"0"];
    
    [hexDic setObject:@"0001" forKey:@"1"];
    
    [hexDic setObject:@"0010" forKey:@"2"];
    
    [hexDic setObject:@"0011" forKey:@"3"];
    
    [hexDic setObject:@"0100" forKey:@"4"];
    
    [hexDic setObject:@"0101" forKey:@"5"];
    
    [hexDic setObject:@"0110" forKey:@"6"];
    
    [hexDic setObject:@"0111" forKey:@"7"];
    
    [hexDic setObject:@"1000" forKey:@"8"];
    
    [hexDic setObject:@"1001" forKey:@"9"];
    
    [hexDic setObject:@"1010" forKey:@"A"];
    
    [hexDic setObject:@"1011" forKey:@"B"];
    
    [hexDic setObject:@"1100" forKey:@"C"];
    
    [hexDic setObject:@"1101" forKey:@"D"];
    
    [hexDic setObject:@"1110" forKey:@"E"];
    
    [hexDic setObject:@"1111" forKey:@"F"];
    
    NSMutableString *binaryString=[[NSMutableString alloc] init];
    
    for (int i=0; i<[hex length]; i++) {
        
        NSRange rage;
        
        rage.length = 1;
        
        rage.location = i;
        
        NSString *key = [hex substringWithRange:rage];
        //NSLog(@"%@",[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]);
        
        binaryString = [NSMutableString stringWithFormat:@"%@%@",binaryString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
        
    }
    //NSLog(@"转化后的二进制为:%@",binaryString);
    return binaryString;
    
}
//字符串转换为nsurl
+ (NSURL *)smartURLForString:(NSString *)str
{
    NSURL *     result;
    NSString *  trimmedStr;
    NSRange     schemeMarkerRange;
    NSString *  scheme;
    
    assert(str != nil);
    
    result = nil;
    
    trimmedStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( (trimmedStr != nil) && (trimmedStr.length != 0) ) {
        schemeMarkerRange = [trimmedStr rangeOfString:@"://"];
        
        if (schemeMarkerRange.location == NSNotFound) {
            result = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", trimmedStr]];
        } else {
            scheme = [trimmedStr substringWithRange:NSMakeRange(0, schemeMarkerRange.location)];
            assert(scheme != nil);
            
            if ( ([scheme compare:@"http"  options:NSCaseInsensitiveSearch] == NSOrderedSame)
                || ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) ) {
                result = [NSURL URLWithString:trimmedStr];
            }
            else
            {
                // It looks like this is some unsupported URL scheme.
            }
        }
    }
    
    return result;
}
//判断url是否可用
-(void) validateUrl: (NSURL *) candidate callBlock:(callBlock)block{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:candidate];
    [request setHTTPMethod:@"HEAD"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"error %@",error);
        if (error) {
            block(YES);
        }
        else
        {
            block(NO);
        }
    }];
    [task resume];
}
+(NSArray *)randomArray
{
    //随机数从这里边产生
    NSMutableArray *startArray=[[NSMutableArray alloc] initWithObjects:@0,@1,@2,@3,@4,@5,@6,@7,nil];
    //随机数产生结果
    NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
    //随机数个数
    NSInteger m=8;
    for (int i=0; i<m; i++) {
        int t=arc4random()%startArray.count;
        resultArray[i]=startArray[t];
        startArray[t]=[startArray lastObject]; //为更好的乱序，故交换下位置
        [startArray removeLastObject];
    }
    return resultArray;
    
}
//随机产生32位的uuid
+ (NSString *)uuidString
 {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
   return [uuid lowercaseString];
}
+ (NSString *)getTimeNow
{
    NSString* date;
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    //[formatter setDateFormat:@"YYYY.MM.dd.hh.mm.ss"];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
    date = [formatter stringFromDate:[NSDate date]];
    NSString * timeNow = [[NSString alloc] initWithFormat:@"%@",date];
    //NSLog(@"%@", timeNow);
    return timeNow;
}
//听筒模式
+(void)setAudioSession{
    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
    //设置为播放和录音状态，以便可以在录制完之后播放录音
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
}
//扬声器模式
+(void)setAudioWaiFangSession
{
    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
    //设置为播放
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
}
@end
