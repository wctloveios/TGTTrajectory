//
//  TGTLoginTopView.m
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>
#import "UIImage+OpenAccount.h"

@implementation TGTLoginTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    
    return self;
}

#pragma mark - Layout

- (void)configureView {
    [self addSubview:self.tgt_imageView];
    [self.tgt_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(0);
        make.height.mas_offset(48);
        make.width.mas_offset(120);
    }];
    
    [self addSubview:self.tgt_descLabel];
    [self.tgt_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tgt_imageView.mas_bottom).offset(42);
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
    }];

    [self addSubview:self.tgt_iconImageView];
    [self.tgt_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tgt_descLabel.mas_bottom).offset(80);
        make.left.mas_offset(70);
        make.height.width.mas_offset(20 );
    }];

    [self addSubview:self.tgt_titleLabel];
    [self.tgt_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.tgt_iconImageView);
        make.left.equalTo(self.tgt_iconImageView.mas_right).offset(10);
    }];
}

#pragma mark - Lazy loading

- (UIImageView *)tgt_imageView {
    if (!_tgt_imageView) {
        _tgt_imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _tgt_imageView.image = [UIImage tgt_imageName:@"TGTOpenAccount_topImage"];
        _tgt_imageView.backgroundColor = [UIColor redColor];
    }
    
    return _tgt_imageView;
}

- (UILabel *)tgt_descLabel {
    if (!_tgt_descLabel) {
        _tgt_descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tgt_descLabel.textAlignment = NSTextAlignmentCenter;
        _tgt_descLabel.text = @"或许会有一些宣传语";
        _tgt_descLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    }
    
    return _tgt_descLabel;
}

- (UILabel *)tgt_titleLabel {
    if (!_tgt_titleLabel) {
        _tgt_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tgt_titleLabel.textAlignment = NSTextAlignmentLeft;
        _tgt_titleLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return _tgt_titleLabel;
}

- (UIImageView *)tgt_iconImageView {
    if (!_tgt_iconImageView) {
        _tgt_iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _tgt_iconImageView.backgroundColor = [UIColor redColor];
    }
    
    return _tgt_iconImageView;
}

@end
