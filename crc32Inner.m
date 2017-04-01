//
//  crc32Inner.m
//  BossOnline
//
//  Created by liyunfei on 16/7/28.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import "crc32Inner.h"

@implementation crc32Inner
- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)crc32WithFileAtPath:(NSString *)filePath handler:(CCCrc32CompletedHandler)handler {
    self.handler = handler;
    self.inputStream = [NSInputStream inputStreamWithFileAtPath:filePath];
    self.inputStream.delegate = self;
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.inputStream open];
    while (!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}
- (void)crc32WithURL:(NSURL *)url handler:(CCCrc32CompletedHandler)handler {
    self.handler = handler;
    self.inputStream = [NSInputStream inputStreamWithURL:url];
    self.inputStream.delegate = self;
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.inputStream open];
    while (!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}
- (void)crc32WithData:(NSData *)data handler:(CCCrc32CompletedHandler)handler {
    self.handler = handler;
    self.inputStream = [NSInputStream inputStreamWithData:data];
    self.inputStream.delegate = self;
    [self.inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [self.inputStream open];
    while (!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}
#pragma mark - NSStreamDelegate
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            self.crc32 = crc32(0, Z_NULL, 0);
            break;
        case NSStreamEventHasBytesAvailable:
        {
            NSInputStream *inputStream = (NSInputStream *)aStream;
            uint8_t buffer[8 * 1024];
            NSInteger byteReaded = 0;
            if ((byteReaded = [inputStream read:buffer maxLength:8 * 1024]) > 0) {
                self.crc32 = crc32(self.crc32, buffer, (uInt)byteReaded);
            }
            break;
        }
        case NSStreamEventErrorOccurred:
            self.isFinished = YES;
            if (self.handler) self.handler(self.crc32);
            break;
        case NSStreamEventEndEncountered:
            self.isFinished = YES;
            [aStream close];
            [aStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            aStream = nil;
            if (self.handler) self.handler(self.crc32);
            break;
        default:
            break;
    }
}
@end
