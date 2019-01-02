//
//  UIFont+WCTFontExtension.h
//  TestWCTAllCategory
//
//  Created by mac on 2018/5/23.
//  Copyright © 2018年 mac. All rights reserved.
//  The author：FJH

#import <UIKit/UIKit.h>

@interface UIFont (WCTFontExtension)

// 苹方-简 常规体
+ (UIFont *)WCT_regularFontOfSize:(CGFloat)fontSize;
// 苹方-简 中粗体
+ (UIFont *)WCT_semiboldFontOfSize:(CGFloat)fontSize;
// 苹方-简 极细体
+ (UIFont *)WCT_ultralightFontOfSize:(CGFloat)fontSize;
// 苹方-简 细体
+ (UIFont *)WCT_lightFontOfSize:(CGFloat)fontSize;
// 苹方-简 纤细体
+ (UIFont *)WCT_thinFontOfSize:(CGFloat)fontSize;
// 苹方-简 中黑体
+ (UIFont *)WCT_mediumFontOfSize:(CGFloat)fontSize;

@end
