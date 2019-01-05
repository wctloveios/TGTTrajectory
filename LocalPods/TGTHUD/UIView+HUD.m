//
//  UIView+HUD.m
//  CocoaAsyncSocket
//
//  Created by mac on 2018/5/31.
//

#import "UIView+HUD.h"

#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

static CGFloat kIndicatorMaxWidth = 96.0f;
static UIView *ims_loadingView;

@implementation UIView (HUD)

#pragma mark - public method
- (void)ims_showHUDWithIndicator {
	[self ims_showHUDIndicatorWithMessage:@"加载中"];
}

- (void)ims_showHUDIndicatorTo:(UIView *)view {
	[self ims_showHUDIndicatorWithMessage:@"加载中" to:view];
}

- (void)ims_showHUDIndicatorWithMessage:(NSString *)message {
    [self ims_showHUDIndicatorWithMessage:message to:self];
}

- (void)ims_showHUDIndicatorWithMessage:(NSString *)message
                                     to:(UIView *)view {
    [self ims_hideHUD];
    
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    
    UIImage *image = [UIImage imageNamed:@"IMSHUD.bundle/loading"];
    UIImageView * imageView =[[UIImageView alloc] initWithImage:image];
    hud.color = [UIColor clearColor];
    
    UIView *customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:0.70];
    [customView addSubview:imageView];
    customView.layer.cornerRadius = 6.0f;
    hud.color = [UIColor clearColor];
    hud.customView = customView;
    
    if (message.length > 0) {
        customView.frame = CGRectMake(0, 0, kIndicatorMaxWidth, kIndicatorMaxWidth);
        
        UILabel *textLabel = [[UILabel alloc] init];
        UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:12.0f];
        textLabel.font = font;
        textLabel.textColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        textLabel.text = message;
        textLabel.textAlignment = NSTextAlignmentCenter;
        CGSize textSize = [message boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
        [customView addSubview:textLabel];
        
        CGFloat imageX = (customView.bounds.size.width - imageView.bounds.size.width) / 2;
        imageView.frame = CGRectMake(imageX, 22, image.size.width, image.size.height);
        CGFloat textWidth = kIndicatorMaxWidth - 20.0f;
        CGFloat textX = (customView.bounds.size.width - textWidth) / 2;
        CGFloat textY = CGRectGetMaxY(imageView.frame) + 12.0f;
        textLabel.frame = CGRectMake(textX, textY, textWidth, textSize.height);
        
    } else {
        customView.frame = CGRectMake(0, 0, image.size.width + 20.0f, image.size.height + 20.0f);
        CGFloat imageX = (customView.bounds.size.width - image.size.width) / 2;
        CGFloat imageY = (customView.bounds.size.height - image.size.height) / 2;
        imageView.frame = CGRectMake(imageX, imageY, image.size.width, image.size.height);
    }
    
    
    [self cycleView:imageView];
    [hud show:YES];
    
    objc_setAssociatedObject(self, &ims_loadingView, imageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)ims_showHUDWithMessage:(NSString *)message{
    [self ims_showHUDWithMessage:message to:self];
}

- (void)ims_showHUDWithMessage:(NSString *)message
                            to:(UIView *)view {
    [self ims_hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelFont = [UIFont systemFontOfSize: 16];
    hud.detailsLabelText = message ?: @"";
    [hud hide:YES afterDelay:2.0];
}

- (void)ims_hideHUD {
    [self ims_hideHUDFromView:self];
}

- (void)ims_hideHUDFromView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
    UIView *loadingView = objc_getAssociatedObject(self, &ims_loadingView);
    if (loadingView) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [loadingView.layer removeAllAnimations];
        });
    }
}

#pragma mark - private method
- (void)cycleView:(UIView *)view{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat: 2*M_PI];
    animation.duration = 1;
    animation.repeatCount = INFINITY;
    animation.removedOnCompletion = NO;
    [view.layer addAnimation:animation forKey:@"SpinAnimation"];
}

@end
