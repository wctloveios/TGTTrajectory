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

/**
 push登录界面
 */
- (void)pushLoginViewController;

@end

NS_ASSUME_NONNULL_END
