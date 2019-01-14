//
//  TGTOpenAccountManager.h
//  TGTOpenAccount
//
//  Created by chuntao.wang1 on 2018/12/17.
//  Copyright © 2018年 chuntao.wang1. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TGTOpenAccountManager : NSObject

+ (instancetype)shareInstance;

//获取登录状态
- (BOOL)isLogin;

//退出登录调用
- (void)logOut;

//登录成功调用
- (void)loginSucces;

/**
 设置rootViewController通过登录状态值

 @param success 成功回调
 */
- (void)tgtSetRootViewControllerWithLoginSuccess:(void(^)(UIViewController *viewController))success;

@end

NS_ASSUME_NONNULL_END
