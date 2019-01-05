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
#import <TGTCategoty/TGTCategoty.h>
#import "BATGraditorButton.h"
#import "UIImage+OpenAccount.h"
#import <TGTHUD/TGTHUD.h>
#import "TGTOpenAccountMarco.h"
#import "TGTVerificationCodeViewController.h"

@interface TGTLoginViewController ()

@property (nonatomic, strong) UITextField *iPhoneTF;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, assign) TGTLoginType tgtLoginType;
@end

@implementation TGTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tgtLoginType = TGTLoginTypeLogin;
}

#pragma mark - configureView

- (void)configureView {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    TGTLoginTopView *topView = [[TGTLoginTopView alloc] initWithFrame:CGRectZero];
    topView.tgt_titleLabel.text = @"手机号";
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(44 + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.right.mas_offset(0);
        make.height.mas_offset(200);
    }];
    
    [self.view addSubview:self.iPhoneTF];
    [self.iPhoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).offset(20);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(30);
    }];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = [UIColor TGT_lineColor];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iPhoneTF.mas_bottom);
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
    
    [self.view addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(10);
        make.right.mas_offset(-70);
    }];
}

#pragma mark - Method

- (void)textFieldDidChange:(UITextField *)textfiled {
    if (textfiled.text.length > 0) {
        [_confirmBtn setBackgroundColor:[UIColor redColor]];
    } else {
        [_confirmBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
}

- (void)chooseRegisterAndLogin:(UIButton *)button {
    if (self.tgtLoginType == TGTLoginTypeLogin) {
        self.tgtLoginType = TGTLoginTypeRegister;
        [button setTitle:@"登录" forState:UIControlStateNormal];
        [self.confirmBtn setTitle:@"注册" forState:UIControlStateNormal];
    } else {
        self.tgtLoginType = TGTLoginTypeLogin;
        [button setTitle:@"注册" forState:UIControlStateNormal];
        [self.confirmBtn setTitle:@"登录" forState:UIControlStateNormal];
    }
}

- (void)clickConfireBtn:(UIButton *)button {
    if (self.iPhoneTF.text.length == 11 && [NSString checkPhoneRegularExpression:self.iPhoneTF.text]) {
        NSLog(@"开始请求服务");
        if (self.tgtLoginType == TGTLoginTypeRegister) {
            //注册
            TGTVerificationCodeViewController *view = [[TGTVerificationCodeViewController alloc] init];
            view.tgtLoginType = TGTLoginTypeRegister;
            [self.navigationController pushViewController:view animated:YES];
        } else {
            //登录
        }
    } else {
        [self ims_showHUDWithMessage:@"请输入正确的手机号!"];
    }
}

#pragma mark - Lazy Loading

- (UITextField *)iPhoneTF {
    if (!_iPhoneTF) {
        _iPhoneTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _iPhoneTF.placeholder = @"请输入手机号码";
        _iPhoneTF.text = @"18557539171";
        _iPhoneTF.keyboardType = UIKeyboardTypePhonePad;
        _iPhoneTF.font = [UIFont systemFontOfSize:14];
        [_iPhoneTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _iPhoneTF;
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitle:@"登录" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.layer.cornerRadius = 20.f;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_confirmBtn addTarget:self action:@selector(clickConfireBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

//- (BATGraditorButton *)confirmBtn {
//    if (!_confirmBtn) {
//        _confirmBtn = [BATGraditorButton buttonWithType:UIButtonTypeCustom];
//        [_confirmBtn setTitle:@"登录" forState:UIControlStateNormal];
//        _confirmBtn.layer.cornerRadius = 20.f;
//        _confirmBtn.layer.masksToBounds = YES;
//        _confirmBtn.titleColor  = [UIColor whiteColor];
//        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//         [_confirmBtn setGradientColors:@[[UIColor lightGrayColor],[UIColor lightGrayColor]]];
//        _confirmBtn.enablehollowOut = YES;
//        [_confirmBtn addTarget:self action:@selector(clickConfireBtn:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _confirmBtn;
//}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(chooseRegisterAndLogin:) forControlEvents:UIControlEventTouchUpInside];
        [_registerBtn sizeToFit];
    }
    
    return _registerBtn;
}

@end
