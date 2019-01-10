//
//  NSBundle+OpenAccount.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "NSBundle+TGTGlue.h"

static NSString *const TGTTGTGlueBundle = @"TGTGlue";

@implementation NSBundle (TGTGlue)

+ (NSBundle *)getGuleBundle {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:TGTTGTGlueBundle ofType:@"bundle"]];
    
    return bundle;
}

@end
