//
//  ViewController.m
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import <TGTOpenAccount/TGTOpenAccount.h>
#import <TGTGlue/TGTTabBarController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [UIApplication sharedApplication].keyWindow.rootViewController = [TGTTabBarController rootViewControoler];
}

@end
