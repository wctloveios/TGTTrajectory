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
static NSString* const kAccessaryKey = @"Accessary";
static NSString* const kLineKey = @"Marginal";
static NSString* const kBackgroundKey = @"Background";
static NSString* const kFillKey = @"Fill";

static NSUInteger const kSystemLeftColor = 0x0000FF;
static NSUInteger const kSystemRifhtColor = 0xFF0000;
static NSUInteger const kNegativeColor = 0xFF352F;
static NSUInteger const kTitleColor = 0x000000;
static NSUInteger const kAccessaryColor = 0xBBBBBB;
static NSUInteger const klineColor = 0xEDEDED;
static NSUInteger const kBackgroundColor = 0xFFFFFF;
static NSUInteger const kFillColor = 0xDDDDDD;

@implementation UIColor (TGTExtension)

#pragma mark - LifeCircle

+ (void)load {
    [self configDefaultColorsWithPlist:@{kSystemLeftKey:@(kSystemLeftColor),
                                         kSystemRightKey:@(kSystemRifhtColor),
                                         kNegativeKey:@(kNegativeColor),
                                         kTitleKey:@(kTitleColor),
                                         kAccessaryKey:@(kAccessaryColor),
                                         kLineKey:@(klineColor),
                                         kBackgroundKey:@(kBackgroundColor),
                                         kFillKey:@(kFillColor)
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

+ (nullable UIColor *)TGT_accessaryColor {
    return [self TGT_colorWithCacheKey:kAccessaryKey];
}

+ (nullable UIColor *)TGT_lineColor {
    return [self TGT_colorWithCacheKey:kLineKey];
}

+ (nullable UIColor *)TGT_backgroundColor {
    return [self TGT_colorWithCacheKey:kBackgroundKey];
}

+ (nullable UIColor *)TGT_fillColor {
    return [self TGT_colorWithCacheKey:kFillKey];
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
        keys = @[kSystemLeftKey,kSystemRightKey,kNegativeKey,kTitleKey,
                 kAccessaryKey,kLineKey,
                 kBackgroundKey,kFillKey];
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
