//
//  IMSMatchViewController.m
//  TGTApp
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TGTMatchViewController.h"
#import <TGTOpenAccount/TGTOpenAccount.h>

@interface TGTMatchViewController ()

@end

@implementation TGTMatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"匹配";
    self.view.backgroundColor = [UIColor yellowColor];

    if (![[TGTOpenAccountManager shareInstance] isLogin]) {
        [[TGTOpenAccountManager shareInstance] pushLoginViewController];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
