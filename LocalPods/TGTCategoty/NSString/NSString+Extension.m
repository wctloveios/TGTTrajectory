//
//  NSString+TGTOpenAccount.m
//  TGTOpenAccount
//
//  Created by chuntao.wang1 on 2018/12/18.
//  Copyright © 2018年 chuntao.wang1. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (BOOL)checkPhoneRegularExpression:(NSString *)phoneNumber {
    /*
     正则表达式：
     ^1：表示以1开头
     [3578]:表示第二位是3578中任何一位
     \：表示转义，后面这个需要转义
     \d：表示数字d，等同【0-9】
     {9}：表示\d执行9次
     */
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:phoneNumber];
    return isMatch;
}

+ (BOOL)checkPasswordRegularExpression:(NSString *)password{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

+ (BOOL)checkUserNameRegularExpression:(NSString *)userName {
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
}

+ (BOOL)checkUserIdCardRegularExpression:(NSString *)idCard{
    NSString *pattern = @"[0-9]{17}([0-9]|X)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

@end
