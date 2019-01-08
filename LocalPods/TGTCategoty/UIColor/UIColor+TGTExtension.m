//
//  UIColor+TGTExtension.m
//  TestTGTAllCategory
//
//  Created by mac on 2018/5/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIColor+TGTExtension.h"

static NSMutableDictionary *cache;

static NSString* const kSystemLeftKey = @"SystemLeft";
static NSString* const kSystemRightKey = @"SystemRight";
static NSString* const kNegativeKey = @"Negative";
static NSString* const kTitleKey = @"Title";
static NSString* const kBBBBBBKey = @"BBBBBB";
static NSString* const kLineKey = @"Marginal";
static NSString* const kFFFFFFKey = @"FFFFFF";
static NSString* const kDDDDDDKey = @"DDDDDD";
static NSString* const kEEEEEEKey = @"EEEEEE";
static NSString* const kCCCCCCKey = @"CCCCCC";

static NSUInteger const kSystemLeftColor = 0x0000FF;
static NSUInteger const kSystemRifhtColor = 0xFF0000;
static NSUInteger const kNegativeColor = 0xFF352F;
static NSUInteger const kTitleColor = 0x000000;
static NSUInteger const kBBBBBBColor = 0xBBBBBB;
static NSUInteger const klineColor = 0xEDEDED;
static NSUInteger const kFFFFFFColor = 0xFFFFFF;
static NSUInteger const kDDDDDDColor = 0xDDDDDD;
static NSUInteger const kEEEEEEColor = 0xEEEEEE;
static NSUInteger const kCCCCCCColor = 0xCCCCCC;

@implementation UIColor (TGTExtension)

#pragma mark - LifeCircle

+ (void)load {
    [self configDefaultColorsWithPlist:@{kSystemLeftKey:@(kSystemLeftColor),
                                         kSystemRightKey:@(kSystemRifhtColor),
                                         kNegativeKey:@(kNegativeColor),
                                         kTitleKey:@(kTitleColor),
                                         kBBBBBBKey:@(kBBBBBBColor),
                                         kLineKey:@(klineColor),
                                         kFFFFFFKey:@(kFFFFFFColor),
                                         kDDDDDDKey:@(kDDDDDDColor),
                                         kEEEEEEKey:@(kEEEEEEColor),
                                         kCCCCCCKey:@(kCCCCCCColor)
                                         }];
}

#pragma mark - InitMethod
+ (nullable UIColor *)TGT_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor TGT_colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (nullable UIColor *)TGT_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((red) / 255.0) green:((green) / 255.0) blue:((blue) / 255.0) alpha:(alpha)];
}

+ (nullable UIColor *)TGT_colorWithHexRGB:(NSUInteger)hexRGB {
    
    return [UIColor TGT_colorWithHexRGB:hexRGB alpha:1.0f];
}

+ (nullable UIColor *)TGT_colorWithHexRGB:(NSUInteger)hexRGB alpha:(CGFloat)alpha {
    return [UIColor TGT_colorWithRed:((float)((hexRGB & 0xFF0000) >> 16)) green:((float)((hexRGB & 0xFF00) >> 8)) blue:((float)(hexRGB & 0xFF)) alpha:alpha];
}

#pragma mark - CacheColor
+ (nullable UIColor *)TGT_systemLeftColor {
    return [self TGT_colorWithCacheKey:kSystemLeftKey];
}

+ (nullable UIColor *)TGT_systemRightColor {
    return [self TGT_colorWithCacheKey:kSystemRightKey];
}

+ (nullable UIColor *)TGT_negativeColor {
    return [self TGT_colorWithCacheKey:kNegativeKey];
}

+ (nullable UIColor *)TGT_titleColor {
    return [self TGT_colorWithCacheKey:kTitleKey];
}

+ (nullable UIColor *)TGT_BBBBBBColor {
    return [self TGT_colorWithCacheKey:kBBBBBBKey];
}

+ (nullable UIColor *)TGT_lineColor {
    return [self TGT_colorWithCacheKey:kLineKey];
}

+ (nullable UIColor *)TGT_FFFFFFColor {
    return [self TGT_colorWithCacheKey:kFFFFFFKey];
}

+ (nullable UIColor *)TGT_DDDDDDColor {
    return [self TGT_colorWithCacheKey:kDDDDDDKey];
}

+ (nullable UIColor *)TGT_EEEEEEColor {
    return [self TGT_colorWithCacheKey:kEEEEEEKey];
}

+ (nullable UIColor *)TGT_CCCCCCColor {
    return [self TGT_colorWithCacheKey:kCCCCCCKey];
}

+ (nullable UIColor *)TGT_colorWithCacheKey:(NSString *)key {
    NSNumber *number = [cache valueForKey:key];
    if (number == nil || ![number isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    NSUInteger value = [number unsignedIntegerValue];
    if (isnan(value) || isinf(value)) {
        return nil;
    }
    
    return [UIColor TGT_colorWithHexRGB:value];
}

+ (void)configDefaultColorsWithPlist:(NSDictionary *)plist {
    static NSArray *keys = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[NSMutableDictionary alloc] initWithCapacity:8];
        keys = @[kSystemLeftKey,kSystemRightKey,kNegativeKey,kTitleKey,kBBBBBBKey,kLineKey,kFFFFFFKey,kDDDDDDKey,kEEEEEEKey,kCCCCCCKey];
    });
    if (plist != nil) {
        [cache removeAllObjects];
        [plist enumerateKeysAndObjectsUsingBlock:^(NSString *colorName, NSNumber  *colorValue, BOOL * _Nonnull stop) {
            [keys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([colorName isEqualToString:key]) {
                    [cache setValue:colorValue forKey:key];
                }
            }];
        }];
    }
}

@end
