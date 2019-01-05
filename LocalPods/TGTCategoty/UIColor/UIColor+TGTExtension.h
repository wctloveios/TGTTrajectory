//
//  UIColor+TGTExtension.h
//  TestTGTAllCategory
//
//  Created by mac on 2018/5/23.
//  Copyright © 2018年 mac. All rights reserved.
//  The author：FJH

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TGTExtension)

// 快速的创建方法， rgb值不需/255.0f
+ (nullable UIColor *)TGT_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (nullable UIColor *)TGT_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 十六进制的初始化方法
 
 @param hexRGB eg:0xFFFFF
 @return UIColor实例
 */
+ (nullable UIColor *)TGT_colorWithHexRGB:(NSUInteger)hexRGB;
+ (nullable UIColor *)TGT_colorWithHexRGB:(NSUInteger)hexRGB alpha:(CGFloat)alpha;

// 这些颜色会被缓存
+ (nullable UIColor *)TGT_systemLeftColor;  /* 主题色1 */
+ (nullable UIColor *)TGT_systemRightColor; /* 主题色2(如果只有一种，直接使用主题色1) */
+ (nullable UIColor *)TGT_negativeColor;    /* 导航栏颜色*/
+ (nullable UIColor *)TGT_titleColor;       /* 标题文字颜色*/
+ (nullable UIColor *)TGT_accessaryColor;   /* 描述文字颜色*/
+ (nullable UIColor *)TGT_lineColor;        /* 线条颜色*/
+ (nullable UIColor *)TGT_backgroundColor;  /* 控制器填充背景色 */
+ (nullable UIColor *)TGT_fillColor;        /* 按钮填充色*/

/**
 用于初始化上面的几个标志性颜色
 @param plist 键值对
 eg:@{@"SystemMatic":@(0x00C989),
    @"Negative":@(0xFF352F),
    @"Title":@(0x333333),
    @"Accessary":@(0x999999),
    @"Accessorial":@(0xAFB8BD),
    @"Marginal":@(0xEDEDED),
    @"Background":@(0xF6F6F6),
    @"Fill":@(0xFFFFFF)
 }
 */
+ (void)configDefaultColorsWithPlist:(NSDictionary *)plist;

@end

NS_ASSUME_NONNULL_END
