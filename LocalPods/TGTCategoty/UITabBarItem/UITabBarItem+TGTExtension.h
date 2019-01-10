//
//  UITabBarItem+IMSLivingLink.h
//  IMSLivingLink
//
//  Created by 冯君骅 on 2018/4/12.
//  Copyright © 2018年 Aliyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (TGTExtension)

+ (UITabBarItem *)tgt_tabBarItemWithTitle:(NSString *)title
									image:(UIImage *)image
							selectedImage:(UIImage *)selectedImage;
@end
