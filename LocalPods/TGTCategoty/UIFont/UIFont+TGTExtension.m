//
//  UIFont+TGTExtension.m
//  TestTGTAllCategory
//
//  Created by mac on 2018/5/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIFont+TGTExtension.h"

static NSString* const kRegular = @"PingFangSC-Regular";
static NSString* const kSemibold = @"PingFangSC-Semibold";
static NSString* const kUltralight = @"PingFangSC-Ultralight";
static NSString* const kLight = @"PingFangSC-Light";
static NSString* const kThin = @"PingFangSC-Thin";
static NSString* const kMedium = @"PingFangSC-Medium";

@implementation UIFont (TGTExtension)

+ (UIFont *)TGT_regularFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kRegular size:fontSize];
}

+ (UIFont *)TGT_semiboldFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kSemibold size:fontSize];
}

+ (UIFont *)TGT_ultralightFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kUltralight size:fontSize];
}

+ (UIFont *)TGT_lightFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kLight size:fontSize];
}

+ (UIFont *)TGT_thinFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kThin size:fontSize];
}

+ (UIFont *)TGT_mediumFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:kMedium size:fontSize];
}

@end

