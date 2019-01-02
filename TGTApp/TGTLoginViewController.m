//
//  TGTLoginViewController.m
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TGTLoginViewController.h"
#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>
#import "UIColor+TGTExtension.h"
#import "BATGraditorButton.h"

@interface TGTLoginViewController ()

@property (nonatomic, strong) BATGraditorButton *confirmBtn;

@end

@implementation TGTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

#pragma mark - configureView

- (void)configureView {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    TGTLoginTopView *topView = [[TGTLoginTopView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(44 + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.right.mas_offset(0);
        make.height.mas_offset(110);
    }];
    
    UIImageView *iPhonIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    iPhonIcon.image = [UIImage imageNamed:@"topView.jpg"];
    [self.view addSubview:iPhonIcon];
    [iPhonIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.tgt_titleLabel.mas_bottom).offset(70);
        make.left.mas_offset(70);
        make.height.width.mas_offset(20 );
    }];
    
    UILabel *iPhoneTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    iPhoneTitle.text = @"手机";
    iPhoneTitle.font = [UIFont systemFontOfSize:14];
    [iPhoneTitle sizeToFit];
    [self.view addSubview:iPhoneTitle];
    [iPhoneTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iPhonIcon);
        make.left.equalTo(iPhonIcon.mas_right).offset(10);
    }];
    
    UITextField *iPhoneTF = [[UITextField alloc] initWithFrame:CGRectZero];
    iPhoneTF.placeholder = @"请输入手机号码";
    iPhoneTF.font = [UIFont systemFontOfSize:14];
    [iPhoneTF addTarget:self action:@selector(updateButtonColor:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:iPhoneTF];
    [iPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iPhonIcon.mas_bottom).offset(20);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(30);
    }];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = [UIColor TGT_lineColor];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iPhoneTF.mas_bottom);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(1);
    }];

    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(40);
        make.centerX.mas_offset(0);
        make.height.mas_offset(40);
        make.width.mas_offset(150);
    }];
}

#pragma mark - Method

- (void)updateButtonColor:(UITextField *)textfiled {
    
}

#pragma mark - Lazy Loading

- (BATGraditorButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [BATGraditorButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        _confirmBtn.layer.cornerRadius = 20.f;
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.titleColor  = [UIColor whiteColor];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_confirmBtn setGradientColors:@[[UIColor TGT_systemLeftColor],[UIColor TGT_systemRightColor]]];
        _confirmBtn.enablehollowOut = YES;
    }
    return _confirmBtn;
}

@end
