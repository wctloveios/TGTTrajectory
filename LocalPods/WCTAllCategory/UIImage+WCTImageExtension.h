//
//  UIImage+WCTImageExtension.h
//  WCTAllFunctionText
//
//  Created by mac on 2018/5/22.
//  Copyright © 2018年 WCT. All rights reserved.
//  The author：WCT

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WCTImageExtension)

/**
 颜色生成图片
 
 @param color 颜色
 @return 图片
 */
+ (nullable UIImage *)WCT_imageWithColor:(UIColor *)color;

/**
 颜色生成图片
 
 @param color 颜色
 @param size 图片显示尺寸
 @param cornerRadius 图片圆角
 @return 图片
 */
+ (nullable UIImage *)WCT_imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

/**
 图片不拉伸
 
 @param image 图片
 @param size 图片区域
 @return 图片
 */
+ (UIImage *)WCT_imageCompress:(UIImage *)image toSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

