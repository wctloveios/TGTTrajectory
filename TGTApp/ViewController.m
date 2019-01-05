//
//  ViewController.m
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import <TGTOpenAccount/TGTOpenAccount.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[TGTOpenAccountManager shareInstance] pushLoginViewController];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[TGTOpenAccountManager shareInstance] pushLoginViewController];
}

@end
