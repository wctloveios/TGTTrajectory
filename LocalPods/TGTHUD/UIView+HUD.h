//
//  UIView+HUD.h
//  CocoaAsyncSocket
//
//  Created by mac on 2018/5/31.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)

- (void)ims_showHUDWithIndicator;

- (void)ims_showHUDIndicatorTo:(UIView *)view;

- (void)ims_showHUDIndicatorWithMessage:(NSString *)message;

- (void)ims_showHUDIndicatorWithMessage:(NSString *)message
                                     to:(UIView *)view;

- (void)ims_showHUDWithMessage:(NSString *)message;

- (void)ims_showHUDWithMessage:(NSString *)message
                            to:(UIView *)view;

- (void)ims_hideHUD;

- (void)ims_hideHUDFromView:(UIView *)view;


@end
