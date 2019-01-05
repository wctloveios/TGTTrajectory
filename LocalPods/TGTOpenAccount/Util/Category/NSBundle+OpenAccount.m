//
//  NSBundle+OpenAccount.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "NSBundle+OpenAccount.h"

static NSString *const TGTOpenAccountBundle = @"TGTOpenAccount";

@implementation NSBundle (OpenAccount)

+ (NSBundle *)getOpenAccountBundle {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:TGTOpenAccountBundle ofType:@"bundle"]];
    
    return bundle;
}

@end
