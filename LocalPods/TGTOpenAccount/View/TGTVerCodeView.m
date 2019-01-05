//
//  TGTVerCodeView.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "TGTVerCodeView.h"

@implementation TGTVerCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    
    return self;
}

#pragma mark - Layout

- (void)configureView {
//    [self addSubview:self.tgt_imageView];
//    [self.tgt_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_offset(0);
//        make.top.mas_offset(0);
//        make.height.mas_offset(48);
//        make.width.mas_offset(120);
//    }];
//
//    [self addSubview:self.tgt_descLabel];
//    [self.tgt_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tgt_imageView.mas_bottom).offset(42);
//        make.left.mas_offset(40);
//        make.right.mas_offset(-40);
//    }];
//
//    [self addSubview:self.tgt_iconImageView];
//    [self.tgt_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tgt_descLabel.mas_bottom).offset(80);
//        make.left.mas_offset(70);
//        make.height.width.mas_offset(20 );
//    }];
//
//    [self addSubview:self.tgt_titleLabel];
//    [self.tgt_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.tgt_iconImageView);
//        make.left.equalTo(self.tgt_iconImageView.mas_right).offset(10);
//    }];
}

#pragma mark - Lazy loading

//- (UITextField *)f {
//    if (!_iPhoneTF) {
//        _iPhoneTF = [[UITextField alloc] initWithFrame:CGRectZero];
//        _iPhoneTF.placeholder = @"请输入手机号码";
//        _iPhoneTF.text = @"18557539171";
//        _iPhoneTF.keyboardType = UIKeyboardTypePhonePad;
//        _iPhoneTF.font = [UIFont systemFontOfSize:14];
//        [_iPhoneTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//    }
//    
//    return _iPhoneTF;
//}


@end
