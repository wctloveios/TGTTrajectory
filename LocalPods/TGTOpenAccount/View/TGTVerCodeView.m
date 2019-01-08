//
//  TGTVerCodeView.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "TGTVerCodeView.h"
#import <Masonry/Masonry.h>
#import <TGTCategoty/TGTCategoty.h>

@interface TGTVerCodeView ()

@property (nonatomic, strong) UITapGestureRecognizer *tapOne;
@property (nonatomic, strong) UITapGestureRecognizer *tapTwo;
@property (nonatomic, strong) UITapGestureRecognizer *tapThree;
@property (nonatomic, strong) UITapGestureRecognizer *tapFour;

@end

@implementation TGTVerCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureView];
    }
    
    return self;
}

#pragma mark - Method

- (void)textFieldDidChange:(UITextField *)tf {
    if (tf.text.length > 0 && tf == self.tgt_firstNumberTF) {
        [tf resignFirstResponder];
        if (self.tgt_secondNumberTF.text.length == 0) {
            [self.tgt_secondNumberTF becomeFirstResponder];
        }
    } else if (tf.text.length > 0 && tf == self.tgt_secondNumberTF) {
        [tf resignFirstResponder];
        if (self.tgt_thirdNumberTF.text.length == 0) {
            [self.tgt_thirdNumberTF becomeFirstResponder];
        }
    } else if (tf.text.length > 0 && tf == self.tgt_thirdNumberTF) {
        [tf resignFirstResponder];
        if (self.tgt_fourNumberTF.text.length == 0) {
            [self.tgt_fourNumberTF becomeFirstResponder];
        }
    } else if (tf.text.length > 0 && tf == self.tgt_fourNumberTF) {
        [tf resignFirstResponder];
    }
    
    if (self.tgt_firstNumberTF.text.length !=0 && self.tgt_secondNumberTF.text.length !=0 && self.tgt_thirdNumberTF.text.length !=0 && self.tgt_fourNumberTF.text.length !=0) {
        if (self.tgt_delegate && [self.tgt_delegate respondsToSelector:@selector(tgt_allTextFiledIsDone:)]) {
            [self.tgt_delegate tgt_allTextFiledIsDone:YES];
        }
    }
}

- (void)tgtTFReaction:(UITapGestureRecognizer *)tap {
    if (tap == self.tapOne) {
        self.tgt_firstNumberTF.text = @"";
        [self.tgt_firstNumberTF becomeFirstResponder];
    } else if (tap == self.tapTwo) {
        self.tgt_secondNumberTF.text = @"";
        [self.tgt_secondNumberTF becomeFirstResponder];
    } else if (tap == self.tapThree) {
        self.tgt_thirdNumberTF.text = @"";
        [self.tgt_thirdNumberTF becomeFirstResponder];
    } else if (tap == self.tapFour) {
        self.tgt_fourNumberTF.text = @"";
        [self.tgt_fourNumberTF becomeFirstResponder];
    }
    
    if (self.tgt_delegate && [self.tgt_delegate respondsToSelector:@selector(tgt_allTextFiledIsDone:)]) {
        [self.tgt_delegate tgt_allTextFiledIsDone:NO];
    }
}

#pragma mark - Layout

- (void)configureView {
    CGFloat tfBGWidth = 33;
    CGFloat tfWidth = 10;
    CGFloat intervalWidth = 13;
    
    UIView *viewOne = [[UIView alloc] initWithFrame:CGRectZero];
    viewOne.backgroundColor = [UIColor TGT_EEEEEEColor];
    viewOne.layer.cornerRadius = 5.f;
    [self addSubview:viewOne];
    [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];
    [self addSubview:self.tgt_firstNumberTF];
    [self.tgt_firstNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(viewOne);
        make.top.mas_offset(1);
        make.width.mas_offset(tfWidth);
        make.height.mas_offset(tfBGWidth);
    }];
    UIView *viewOneMake = [[UIView alloc] initWithFrame:CGRectZero];
    viewOneMake.backgroundColor = [UIColor clearColor];
    viewOneMake.layer.cornerRadius = 5.f;
    [self addSubview:viewOneMake];
    [viewOneMake mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];

    UIView *viewTwo = [[UIView alloc] initWithFrame:CGRectZero];
    viewTwo.backgroundColor = [UIColor TGT_EEEEEEColor];
    viewTwo.layer.cornerRadius = 5.f;
    [self addSubview:viewTwo];
    [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewOne.mas_right).offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];
    [self addSubview:self.tgt_secondNumberTF];
    [self.tgt_secondNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(viewTwo);
        make.top.mas_offset(1);
        make.width.mas_offset(tfWidth);
        make.height.mas_offset(tfBGWidth);
    }];
    UIView *viewTwoMake = [[UIView alloc] initWithFrame:CGRectZero];
    viewTwoMake.backgroundColor = [UIColor clearColor];
    viewTwoMake.layer.cornerRadius = 5.f;
    [self addSubview:viewTwoMake];
    [viewTwoMake mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewOne.mas_right).offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];

    UIView *viewThree = [[UIView alloc] initWithFrame:CGRectZero];
    viewThree.backgroundColor = [UIColor TGT_EEEEEEColor];
    viewThree.layer.cornerRadius = 5.f;
    [self addSubview:viewThree];
    [viewThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewTwo.mas_right).offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];
    [self addSubview:self.tgt_thirdNumberTF];
    [self.tgt_thirdNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(viewThree);
        make.top.mas_offset(1);
        make.width.mas_offset(tfWidth);
        make.height.mas_offset(tfBGWidth);
    }];
    UIView *viewThreeMake = [[UIView alloc] initWithFrame:CGRectZero];
    viewThreeMake.backgroundColor = [UIColor clearColor];
    viewThreeMake.layer.cornerRadius = 5.f;
    [self addSubview:viewThreeMake];
    [viewThreeMake mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewTwo.mas_right).offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];

    UIView *viewFour = [[UIView alloc] initWithFrame:CGRectZero];
    viewFour.backgroundColor = [UIColor TGT_EEEEEEColor];
    viewFour.layer.cornerRadius = 5.f;
    [self addSubview:viewFour];
    [viewFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewThree.mas_right).offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];
    [self addSubview:self.tgt_fourNumberTF];
    [self.tgt_fourNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(viewFour);
        make.top.mas_offset(1);
        make.width.mas_offset(tfWidth);
        make.height.mas_offset(tfBGWidth);
    }];
    UIView *viewFourMake = [[UIView alloc] initWithFrame:CGRectZero];
    viewFourMake.backgroundColor = [UIColor clearColor];
    viewFourMake.layer.cornerRadius = 5.f;
    [self addSubview:viewFourMake];
    [viewFourMake mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewThree.mas_right).offset(intervalWidth);
        make.top.mas_offset(1);
        make.height.width.mas_offset(tfBGWidth);
    }];
    
    _tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgtTFReaction:)];
    _tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgtTFReaction:)];
    _tapThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgtTFReaction:)];
    _tapFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgtTFReaction:)];
    viewOneMake.userInteractionEnabled = YES;
    viewOneMake.userInteractionEnabled = YES;
    viewOneMake.userInteractionEnabled = YES;
    viewOneMake.userInteractionEnabled = YES;
    [viewOneMake addGestureRecognizer:_tapOne];
    [viewTwoMake addGestureRecognizer:_tapTwo];
    [viewThreeMake addGestureRecognizer:_tapThree];
    [viewFourMake addGestureRecognizer:_tapFour];
}

#pragma mark - Lazy loading

- (UITextField *)tgt_firstNumberTF {
    if (!_tgt_firstNumberTF) {
        _tgt_firstNumberTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _tgt_firstNumberTF.keyboardType = UIKeyboardTypePhonePad;
        _tgt_firstNumberTF.font = [UIFont systemFontOfSize:20];
        [_tgt_firstNumberTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _tgt_firstNumberTF;
}

- (UITextField *)tgt_secondNumberTF {
    if (!_tgt_secondNumberTF) {
        _tgt_secondNumberTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _tgt_secondNumberTF.keyboardType = UIKeyboardTypePhonePad;
        _tgt_secondNumberTF.font = [UIFont systemFontOfSize:20];
        [_tgt_secondNumberTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _tgt_secondNumberTF;
}

- (UITextField *)tgt_thirdNumberTF {
    if (!_tgt_thirdNumberTF) {
        _tgt_thirdNumberTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _tgt_thirdNumberTF.keyboardType = UIKeyboardTypePhonePad;
        _tgt_thirdNumberTF.font = [UIFont systemFontOfSize:20];
        [_tgt_thirdNumberTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _tgt_thirdNumberTF;
}

- (UITextField *)tgt_fourNumberTF {
    if (!_tgt_fourNumberTF) {
        _tgt_fourNumberTF = [[UITextField alloc] initWithFrame:CGRectZero];
        _tgt_fourNumberTF.keyboardType = UIKeyboardTypePhonePad;
        _tgt_fourNumberTF.font = [UIFont systemFontOfSize:20];
        [_tgt_fourNumberTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _tgt_fourNumberTF;
}

@end
