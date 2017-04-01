//
//  crc32Inner.h
//  BossOnline
//
//  Created by liyunfei on 16/7/28.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "crc32CLass.h"
@interface crc32Inner : NSObject<NSStreamDelegate>
@property (nonatomic, strong) NSInputStream           *inputStream;
@property (nonatomic, assign) uLong                   crc32;
@property (nonatomic, copy  ) CCCrc32CompletedHandler handler;
@property (nonatomic, assign) BOOL                    isFinished;

- (void)crc32WithFileAtPath:(NSString *)filePath handler:(CCCrc32CompletedHandler)handler;

- (void)crc32WithURL:(NSURL *)url handler:(CCCrc32CompletedHandler)handler;

- (void)crc32WithData:(NSData *)data handler:(CCCrc32CompletedHandler)handler;
@end
