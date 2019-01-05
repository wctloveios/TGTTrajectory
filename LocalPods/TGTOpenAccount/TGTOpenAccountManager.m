//
//  TGTOpenAccountManager.m
//  TGTOpenAccount
//
//  Created by chuntao.wang1 on 2018/12/17.
//  Copyright © 2018年 chuntao.wang1. All rights reserved.
//

#import "TGTOpenAccountManager.h"
#import "TGTLoginViewController.h"

#define TGTKeyWindow [UIApplication sharedApplication].delegate.window

@implementation TGTOpenAccountManager

+ (instancetype)shareInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (void)pushLoginViewController {
    UINavigationController *navi = [[UINavigationController alloc] init];
    TGTKeyWindow.rootViewController = navi;
    [navi pushViewController:[TGTLoginViewController new] animated:YES];
}

#pragma mark - Private

@end
