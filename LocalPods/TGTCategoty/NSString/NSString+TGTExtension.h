//
//  NSString+TGTExtension.h
//  TGTOpenAccount
//
//  Created by TGT on 2018/12/18.
//  Copyright © 2018年 TGT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TGTExtension)

#pragma mark - 手机正则校验
/**
 手机正则校验
 
 @param phoneNumber 手机号码
 @return 是否合法
 */
+ (BOOL)checkPhoneRegularExpression:(NSString *)phoneNumber;

#pragma mark - 密码正则校验
/**
 密码正则校验

 @param password 密码
 @return 是否合法（6-18位数字和字母组合）
 */
+ (BOOL)checkPasswordRegularExpression:(NSString *)password;

#pragma mark - 用户名正则校验
/**
 用户名正则校验

 @param userName 用户名
 @return 是否合法（20位的中文或英文）
 */
+ (BOOL)checkUserNameRegularExpression:(NSString *)userName;

#pragma mark - 身份证正则校验
/**
 身份证正则校验

 @param idCard 身份证
 @return 是否合法（18位）
 */
+ (BOOL)checkUserIdCardRegularExpression:(NSString *)idCard;

@end

NS_ASSUME_NONNULL_END
