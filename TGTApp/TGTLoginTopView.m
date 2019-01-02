//
//  TGTLoginTopView.m
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "TGTLoginTopView.h"
#import <Masonry/Masonry.h>

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
    
    [self addSubview:self.tgt_titleLabel];
    [self.tgt_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tgt_imageView.mas_bottom).offset(42);
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
    }];
}

#pragma mark - Lazy loading

- (UIImageView *)tgt_imageView {
    if (!_tgt_imageView) {
        _tgt_imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _tgt_imageView.image = [UIImage imageNamed:@"topView.jpg"];
        _tgt_imageView.backgroundColor = [UIColor redColor];
    }
    
    return _tgt_imageView;
}

- (UILabel *)tgt_titleLabel {
    if (!_tgt_titleLabel) {
        _tgt_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tgt_titleLabel.textAlignment = NSTextAlignmentCenter;
        _tgt_titleLabel.text = @"或许会有一些宣传语";
        _tgt_titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    }
    
    return _tgt_titleLabel;
}

@end
