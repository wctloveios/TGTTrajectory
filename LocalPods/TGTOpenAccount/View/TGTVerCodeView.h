//
//  TGTVerCodeView.h
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TGTVerCodeViewTFDelegate <NSObject>

- (void)tgt_allTextFiledIsDone:(BOOL)isDone;

@end


@interface TGTVerCodeView : UIView

@property (nonatomic, strong) UITextField *tgt_firstNumberTF;
@property (nonatomic, strong) UITextField *tgt_secondNumberTF;
@property (nonatomic, strong) UITextField *tgt_thirdNumberTF;
@property (nonatomic, strong) UITextField *tgt_fourNumberTF;
@property (nonatomic, weak) id<TGTVerCodeViewTFDelegate> tgt_delegate;

@end

NS_ASSUME_NONNULL_END
