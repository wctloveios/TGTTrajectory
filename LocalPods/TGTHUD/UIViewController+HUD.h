//
//  UIViewController+HUDView.h
//
//  Created by muda on 2017/11/20.
//  Copyright © 2017年 muda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

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
