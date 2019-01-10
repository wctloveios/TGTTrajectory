//
//  TGTPwdTFView.m
//  BlocksKit
//
//  Created by mac on 2019/1/8.
//

#import "TGTPwdTFView.h"
#import <Masonry/Masonry.h>
#import <TGTCategoty/TGTCategoty.h>
#import "UIImage+OpenAccount.h"

@implementation TGTPwdTFView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    
    return self;
}

#pragma mark - Method

- (void)textFieldDidChange:(UITextField *)tf {
    if (tf.text.length) {
        if (self.tgt_delegate && [self.tgt_delegate respondsToSelector:@selector(tgt_textFiledIsDone:)]) {
            [self.tgt_delegate tgt_textFiledIsDone:YES];
        }
    } else {
        if (self.tgt_delegate && [self.tgt_delegate respondsToSelector:@selector(tgt_textFiledIsDone:)]) {
            [self.tgt_delegate tgt_textFiledIsDone:NO];
        }
    }
}

- (void)changePwdShowStyle:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        self.tgt_pwdTF.secureTextEntry = NO;
    } else {
        self.tgt_pwdTF.secureTextEntry = YES;
    }
}

#pragma mark - Layout

- (void)configureView {
    [self addSubview:self.tgt_pwdTF];
    [self.tgt_pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(0);
        make.right.mas_offset(-20);
        make.height.mas_offset(30);
    }];
    
    [self addSubview:self.tgt_pwdBtn];
    [self.tgt_pwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.tgt_pwdTF);
        make.right.mas_offset(0);
        make.height.width.mas_offset(20);
    }];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = [UIColor TGT_CCCCCCColor];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.height.mas_offset(1);
        make.bottom.mas_offset(0);
    }];
}


#pragma mark - Lazy loading

- (UIButton *)tgt_pwdBtn {
    if (!_tgt_pwdBtn) {
        _tgt_pwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tgt_pwdBtn setImage:[UIImage tgt_openAccountImageName:@"tgt_icon_phone"] forState:UIControlStateNormal];
        [_tgt_pwdBtn setImage:[UIImage tgt_openAccountImageName:@"tgt_btn_sel_agree"] forState:UIControlStateSelected];
        _tgt_pwdBtn.selected = YES;
        [_tgt_pwdBtn addTarget:self action:@selector(changePwdShowStyle:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _tgt_pwdBtn;
}

- (UITextField *)tgt_pwdTF {
    if (!_tgt_pwdTF) {
        _tgt_pwdTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _tgt_pwdTF.placeholder = @"请输入密码（6-20位）";
        _tgt_pwdTF.font = [UIFont systemFontOfSize:12];
        _tgt_pwdTF.secureTextEntry = NO;
        [_tgt_pwdTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _tgt_pwdTF;
}

@end
