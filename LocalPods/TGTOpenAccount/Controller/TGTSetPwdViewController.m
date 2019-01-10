//
//  TGTSetPwdViewController.m
//  BlocksKit
//
//  Created by mac on 2019/1/8.
//

#import "TGTSetPwdViewController.h"
#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>
#import "UIImage+OpenAccount.h"
#import "TGTPwdTFView.h"
#import "TGTOpenAccountManager.h"

@interface TGTSetPwdViewController ()<TGTPwdTFViewTFDelegate>

@property (nonatomic, strong) UIButton *confirmBtn;

@end

@implementation TGTSetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

#pragma mark - Method

- (void)clickConfireBtn:(UIButton *)button {
    if (self.loginType == TGTLoginTypeLogin) {
        NSLog(@"登录---直接登录成功了");
    } else {
        NSLog(@"注册---直接登录成功了");
    }
    
    [[TGTOpenAccountManager shareInstance] loginSucces];
    [[TGTOpenAccountManager shareInstance] changeRootViewControllerWithLoginSuccess];
}

#pragma mark - TGTPwdTFViewTFDelegate

- (void)tgt_textFiledIsDone:(BOOL)isHavePwd {
    if (isHavePwd) {
        _confirmBtn.userInteractionEnabled = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_imageName:@"tgt_btn_confim_sel"] forState:UIControlStateNormal];
    } else {
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn setBackgroundImage:[UIImage tgt_imageName:@"tgt_btn_confim_unSel"] forState:UIControlStateNormal];
    }
}

#pragma mark - configureView

- (void)configureView {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    TGTLoginTopView *topView = [[TGTLoginTopView alloc] initWithFrame:CGRectZero];
    topView.tgt_titleLabel.text = @"密码";
    topView.tgt_iconImageView.image = [UIImage tgt_imageName:@"tgt_icon_phone"];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(44 + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.right.mas_offset(0);
        make.height.mas_offset(110);
    }];
    
    TGTPwdTFView *pwdView = [[TGTPwdTFView alloc] initWithFrame:CGRectZero];
    pwdView.tgt_delegate = self;
    [self.view addSubview:pwdView];
    [pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.tgt_iconImageView.mas_bottom).offset(11);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(30);
    }];
    
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.mas_bottom).offset(5);
        make.centerX.mas_offset(0);
        make.height.mas_offset(81);
        make.width.mas_offset(148);
    }];
}


#pragma mark - Lazy Loading

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.layer.cornerRadius = 20.f;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_imageName:@"tgt_btn_confim_unSel"] forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _confirmBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn addTarget:self action:@selector(clickConfireBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

@end

