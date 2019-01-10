//
//  TGTVerCodeViewController.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "TGTVerCodeViewController.h"
#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>
#import "UIImage+OpenAccount.h"
#import "TGTVerCodeView.h"
#import <TGTCategoty/TGTCategoty.h>
#import "TGTSetPwdViewController.h"

@interface TGTVerCodeViewController ()<TGTVerCodeViewTFDelegate>

@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation TGTVerCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self configureView];
}

#pragma mark - TGTVerCodeViewTFDelegate

- (void)tgt_allTextFiledIsDone:(BOOL)isDone {
    if (isDone) {
        _confirmBtn.userInteractionEnabled = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_sel"] forState:UIControlStateNormal];
    } else {
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_unSel"] forState:UIControlStateNormal];
    }
}

#pragma mark - Method

- (void)clickConfireBtn:(UIButton *)button {
    NSLog(@"验证码---进入密码页面！");
    TGTSetPwdViewController *view = [[TGTSetPwdViewController alloc] init];
    view.loginType = TGTLoginTypeRegister;
    [self.navigationController pushViewController:view animated:YES];
}

#pragma mark - configureView

- (void)configureView {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    TGTLoginTopView *topView = [[TGTLoginTopView alloc] initWithFrame:CGRectZero];
    topView.tgt_titleLabel.text = @"手机验证码";
    topView.tgt_iconImageView.image = [UIImage tgt_openAccountImageName:@"tgt_icon_phone"];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(44 + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.right.mas_offset(0);
        make.height.mas_offset(110);
    }];

    TGTVerCodeView *codeView = [[TGTVerCodeView alloc] initWithFrame:CGRectZero];
    codeView.tgt_delegate = self;
    [codeView.tgt_firstNumberTF becomeFirstResponder];
    [self.view addSubview:codeView];
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.tgt_iconImageView.mas_bottom).offset(11);
        make.centerX.mas_offset(0);
        make.width.mas_offset(197);
        make.height.mas_offset(35);
    }];
    
    [self.view addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeView.mas_bottom).offset(17);
        make.centerX.mas_offset(0);
        make.height.mas_offset(11);
    }];
    
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descLabel.mas_bottom).offset(5);
        make.centerX.mas_offset(0);
        make.height.mas_offset(81);
        make.width.mas_offset(148);
    }];
}

#pragma mark - Lazy Loading

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        _descLabel.font = [UIFont systemFontOfSize:12];
        _descLabel.textColor = [UIColor TGT_BBBBBBColor];
        _descLabel.text = [NSString stringWithFormat:@"已发送验证码至%@",self.iPhoneStr];
        [_descLabel sizeToFit];
    }
    
    return _descLabel;
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.layer.cornerRadius = 20.f;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_unSel"] forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _confirmBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn addTarget:self action:@selector(clickConfireBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

@end
