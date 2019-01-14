//
//  AppDelegate+TGTOpenaccount.m
//  BlocksKit
//
//  Created by mac on 2019/1/14.
//

#import "AppDelegate+TGTOpenaccount.h"
#import <TGTOpenAccount/TGTOpenAccount.h>

@implementation AppDelegate (TGTOpenaccount)

- (void)tgt_judgeLoginSate {
    [[TGTOpenAccountManager shareInstance] tgtSetRootViewControllerWithLoginSuccess:^(UIViewController * _Nonnull viewController) {
        
    }];
}
@end
