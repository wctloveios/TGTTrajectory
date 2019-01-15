//
//  TGTRegisterViewController.m
//  BlocksKit
//
//  Created by mac on 2019/1/15.
//

#import "TGTRegisterViewController.h"
#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>
#import <TGTCategoty/TGTCategoty.h>
#import "UIImage+OpenAccount.h"
#import <TGTHUD/TGTHUD.h>
#import "TGTOpenAccountMarco.h"
#import "TGTVerCodeViewController.h"

@interface TGTRegisterViewController ()

@property (nonatomic, strong) UITextField *iPhoneTF;
@property (nonatomic, strong) UIButton *confirmBtn;

@end

@implementation TGTRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

#pragma mark - Method

- (void)textFieldDidChange:(UITextField *)textfiled {
    if (textfiled.text.length >= 11 ) {
        _confirmBtn.userInteractionEnabled = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_sel"] forState:UIControlStateNormal];
    } else {
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_nomal"] forState:UIControlStateNormal];
    }
}

- (void)clickConfireBtn:(UIButton *)button {
    if (self.iPhoneTF.text.length == 11 && [NSString checkPhoneRegularExpression:self.iPhoneTF.text]) {
        NSLog(@"开始请求服务");
        TGTVerCodeViewController *view = [[TGTVerCodeViewController alloc] init];
        view.iPhoneStr = self.iPhoneTF.text;
        [self.navigationController pushViewController:view animated:YES];
    } else {
        [self ims_showHUDWithMessage:@"请输入正确的手机号!"];
    }
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
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = [UIColor TGT_CCCCCCColor];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iPhoneTF.mas_bottom);
        make.left.mas_offset(70);
        make.right.mas_offset(-70);
        make.height.mas_offset(1);
    }];
    
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(20);
        make.centerX.mas_offset(0);
        make.height.mas_offset(81);
        make.width.mas_offset(148);
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

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.layer.cornerRadius = 20.f;
        _confirmBtn.layer.masksToBounds = YES;
        [_confirmBtn setBackgroundImage:[UIImage tgt_openAccountImageName:@"tgt_btn_confim_nomal"] forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _confirmBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
        _confirmBtn.userInteractionEnabled = NO;
        [_confirmBtn addTarget:self action:@selector(clickConfireBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

@end
