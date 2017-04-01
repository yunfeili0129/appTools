//
//  UIImage+RoundRectImage.h
//  
//
//  Created by liyunfei on 15/10/14.
//  Copyright © 2016年 liyunfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundRectImage)

+ (UIImage *)imageOfRoundRectWithImage: (UIImage *)image
                                  size: (CGSize)size
                                radius: (CGFloat)radius;

@end
