//
//  ViewController.m
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TGTLoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[TGTLoginViewController new]];
    [UIApplication sharedApplication].keyWindow.rootViewController = navi;
}

@end
