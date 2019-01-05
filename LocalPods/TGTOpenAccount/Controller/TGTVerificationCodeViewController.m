//
//  TGTVerificationCodeViewController.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "TGTVerificationCodeViewController.h"
#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>
#import "UIImage+OpenAccount.h"

@interface TGTVerificationCodeViewController ()

@property (nonatomic, strong) UIButton *confirmBtn;

@end

@implementation TGTVerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self configureView];
}

#pragma mark - configureView

- (void)configureView {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    TGTLoginTopView *topView = [[TGTLoginTopView alloc] initWithFrame:CGRectZero];
    topView.tgt_titleLabel.text = @"手机验证码";
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(44 + [UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.right.mas_offset(0);
        make.height.mas_offset(110);
    }];

//    [self.view addSubview:self.confirmBtn];
//    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(lineView.mas_bottom).offset(40);
//        make.centerX.mas_offset(0);
//        make.height.mas_offset(40);
//        make.width.mas_offset(150);
//    }];

}

#pragma mark - Method

- (void)textFieldDidChange:(UITextField *)textfiled {
//    if (textfiled.text.length > 0) {
//        [_confirmBtn setBackgroundColor:[UIColor redColor]];
//    } else {
//        [_confirmBtn setBackgroundColor:[UIColor lightGrayColor]];
//    }
}

- (void)clickConfireBtn:(UIButton *)button {
//    if (self.iPhoneTF.text.length == 11 && [NSString checkPhoneRegularExpression:self.iPhoneTF.text]) {
//        NSLog(@"开始请求服务");
//        if (self.tgtLoginType == TGTLoginTypeRegister) {
//            //注册
//            TGTVerificationCodeViewController *view = [[TGTVerificationCodeViewController alloc] init];
//            view.tgtLoginType = TGTLoginTypeRegister;
//            [self.navigationController pushViewController:view animated:YES];
//        } else {
//            //登录
//        }
//    } else {
//        [self ims_showHUDWithMessage:@"请输入正确的手机号!"];
//    }
}


#pragma mark - Lazy Loading

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

@end
