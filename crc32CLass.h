//
//  crc32CLass.h
//  BossOnline
//
//  Created by liyunfei on 16/7/27.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <zlib.h>
#import <zconf.h>
typedef void(^CCCrc32CompletedHandler)(uLong crc32);  // crc32 == 0 : error
@interface crc32CLass : NSObject
// 小文件crc32校验
+ (uLong)crc32WithFilePath:(NSString *)filePath;

+ (uLong)crc32WithURL:(NSURL *)url;

+ (uLong)crc32WithData:(NSData *)data;

// 大文件crc32校验
+ (void)crc32WithFileAtPath:(NSString *)filePath handler:(CCCrc32CompletedHandler)handler;

+ (void)crc32WithURL:(NSURL *)url handler:(CCCrc32CompletedHandler)handler;

+ (void)crc32WithData:(NSData *)data handler:(CCCrc32CompletedHandler)handler;

@end
