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
#import "UIImage+OpenAccount.h"
#import <TGTHUD/TGTHUD.h>
#import "TGTOpenAccountMarco.h"
#import "TGTRegisterViewController.h"
#import "TGTPwdTFView.h"
#import "TGTOpenAccountManager.h"

@interface TGTLoginViewController ()

@property (nonatomic, strong) UITextField *iPhoneTF;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) TGTPwdTFView *pwdTFView;

@end

@implementation TGTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

#pragma mark - Method

- (void)textFieldDidChange:(UITextField *)textfiled {
    if (textfiled.text.length != 0 && self.pwdTFView.tgt_pwdTF.text.length != 0) {
        _confirmBtn.userInteractionEnabled = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_sel"] forState:UIControlStateNormal];
    } else {
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_nomal"] forState:UIControlStateNormal];
    }
}

- (void)chooseRegisterAndLogin:(UIButton *)button {
    TGTRegisterViewController *view = [TGTRegisterViewController new];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)clickConfireBtn:(UIButton *)button {
    if (self.iPhoneTF.text.length != 11 || ![NSString checkPhoneRegularExpression:self.iPhoneTF.text]) {
        [self ims_showHUDWithMessage:@"请输入正确的手机号!"];
        return;
    }
    
    if (self.pwdTFView.tgt_pwdTF.text.length < 6 || self.pwdTFView.tgt_pwdTF.text.length > 20) {
        [self ims_showHUDWithMessage:@"请确认密码长度在 6-20 位之间"];
        return;
    }
    
    //请求接口，成功就进入登录态
    NSLog(@"登录---直接登录成功了");
    [[TGTOpenAccountManager shareInstance] loginSucces];
}

#pragma mark - configureView

- (void)configureView {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    TGTLoginTopView *topView = [[TGTLoginTopView alloc] initWithFrame:CGRectZero];
    topView.tgt_titleLabel.text = @"手机号";
    topView.tgt_iconImageView.image = [UIImage tgt_openAccountImageName:@"tgt_icon_phone"];
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
    
    UIView *phoneLineView = [[UIView alloc] initWithFrame:CGRectZero];
    phoneLineView.backgroundColor = [UIColor TGT_CCCCCCColor];
    [self.view addSubview:phoneLineView];
    [phoneLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iPhoneTF.mas_bottom);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(1);
    }];
    
    [self.view addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLineView.mas_bottom).offset(15);
        make.left.mas_offset(70);
        make.height.mas_offset(20);
        make.width.mas_offset(15);
    }];
    
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
    }];
    
    [self.view addSubview:self.pwdTFView];
    [self.pwdTFView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(5);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(30);
    }];

    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTFView.mas_bottom).offset(40);
        make.centerX.mas_offset(0);
        make.height.mas_offset(81);
        make.width.mas_offset(148);
    }];
    
    [self.view addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTFView.mas_bottom).offset(10);
        make.right.mas_offset(-70);
    }];
}

#pragma mark - Lazy Loading

- (UITextField *)iPhoneTF {
    if (!_iPhoneTF) {
        _iPhoneTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _iPhoneTF.placeholder = @"请输入手机号码";
        _iPhoneTF.text = @"1855753917";
        _iPhoneTF.keyboardType = UIKeyboardTypePhonePad;
        _iPhoneTF.font = [UIFont systemFontOfSize:14];
        [_iPhoneTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _iPhoneTF;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"密码";
    }
    
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.image = [UIImage tgt_openAccountImageName:@"tgt_icon_pwd"];
    }
    
    return _iconImageView;
}

- (TGTPwdTFView *)pwdTFView {
    if (!_pwdTFView) {
        _pwdTFView = [[TGTPwdTFView alloc] initWithFrame:CGRectZero];
        [_pwdTFView.tgt_pwdTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _pwdTFView;
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.layer.cornerRadius = 20.f;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_nomal"] forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"登录" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _confirmBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn addTarget:self action:@selector(clickConfireBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerBtn setTitleColor:[UIColor TGT_colorWithHexRGB:0xff6f61] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(chooseRegisterAndLogin:) forControlEvents:UIControlEventTouchUpInside];
        [_registerBtn sizeToFit];
        
        NSMutableAttributedString *tncString = [[NSMutableAttributedString alloc] initWithString:@"注册"];
        //设置下划线...
        /*
         NSUnderlineStyleNone                                    = 0x00, 无下划线
         NSUnderlineStyleSingle                                  = 0x01, 单行下划线
         NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
         NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
         */
        [tncString addAttribute:NSUnderlineStyleAttributeName
                          value:@(NSUnderlineStyleSingle)
                          range:(NSRange){0,[tncString length]}];
        [tncString addAttribute:NSForegroundColorAttributeName value:[UIColor TGT_colorWithHexRGB:0xff6f61] range:NSMakeRange(0,[tncString length])];
        [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor TGT_colorWithHexRGB:0xff6f61] range:(NSRange){0,[tncString length]}];
        [_registerBtn setAttributedTitle:tncString forState:UIControlStateNormal];
    }
    
    return _registerBtn;
}


@end
