//
//  TGTOpenAccountManager.m
//  TGTOpenAccount
//
//  Created by chuntao.wang1 on 2018/12/17.
//  Copyright © 2018年 chuntao.wang1. All rights reserved.
//

#import "TGTOpenAccountManager.h"
#import "TGTLoginViewController.h"
#import <TGTGlue/TGTTabBarController.h>

static NSString *const  TGTLoginSuccessSateKey = @"TGT_LOGIN_SUCCESS_STATE";

@implementation TGTOpenAccountManager

+ (instancetype)shareInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (BOOL)isLogin {
    BOOL loginState = [[NSUserDefaults standardUserDefaults] boolForKey:TGTLoginSuccessSateKey];
    return loginState;
}

- (void)logOut {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:TGTLoginSuccessSateKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loginSucces {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:TGTLoginSuccessSateKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)pushLoginViewController {
    UINavigationController *navi = [[UINavigationController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = navi;
    [navi pushViewController:[TGTLoginViewController new] animated:YES];
}

- (void)changeRootViewControllerWithLoginSuccess {
    [UIApplication sharedApplication].keyWindow.rootViewController = [TGTTabBarController rootViewControoler];
}

#pragma mark - Private

@end
