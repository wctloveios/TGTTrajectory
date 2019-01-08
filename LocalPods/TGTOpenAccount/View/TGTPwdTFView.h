//
//  TGTPwdTFView.h
//  BlocksKit
//
//  Created by mac on 2019/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TGTPwdTFViewTFDelegate <NSObject>

- (void)tgt_textFiledIsDone:(BOOL)isHavePwd;

@end

@interface TGTPwdTFView : UIView

@property (nonatomic, strong) UITextField *tgt_pwdTF;
@property (nonatomic, strong) UIButton *tgt_pwdBtn;
@property (nonatomic, weak) id<TGTPwdTFViewTFDelegate> tgt_delegate;

@end

NS_ASSUME_NONNULL_END
