//
//  crc32CLass.m
//  BossOnline
//
//  Created by liyunfei on 16/7/27.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import "crc32CLass.h"
#import <Foundation/Foundation.h>
#import "crc32Inner.h"
@implementation crc32CLass
+ (uLong)crc32WithFilePath:(NSString *)filePath {
    return [self crc32WithData:[NSData dataWithContentsOfFile:filePath]];
}

+ (uLong)crc32WithURL:(NSURL *)url {
    return [self crc32WithData:[NSData dataWithContentsOfURL:url]];
}

+ (uLong)crc32WithData:(NSData *)data {
    uLong crc = crc32(0, Z_NULL, 0);
    return crc32(crc, data.bytes, (uInt)data.length);
}

+ (void)crc32WithFileAtPath:(NSString *)filePath handler:(CCCrc32CompletedHandler)handler {
    crc32Inner *crc32I = [[crc32Inner alloc] init];
    [crc32I crc32WithFileAtPath:filePath handler:handler];
}

+ (void)crc32WithURL:(NSURL *)url handler:(CCCrc32CompletedHandler)handler {
    crc32Inner *crc32I = [[crc32Inner alloc] init];
    [crc32I crc32WithURL:url handler:handler];
}

+ (void)crc32WithData:(NSData *)data handler:(CCCrc32CompletedHandler)handler {
    crc32Inner *crc32I = [[crc32Inner alloc] init];
    [crc32I crc32WithData:data handler:handler];
}



// 使用方法 (fileUrl 文件路劲）
// 小文件
//[CCCrc32 crc32WithUrl:fileUrl]
//
//// 大文件
//[CCCrc32 crc32WithURL:fileUrl handler:^(uLong crc32) {
//    if ([self.crc32 integerValue] == crc32) {
//        self.isDownloaded = YES;
//        self.localURL = filePath;
//    }
//}];
@end
