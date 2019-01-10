//
//  UITabBarItem+IMSLivingLink.m
//  IMSLivingLink
//
//  Created by 冯君骅 on 2018/4/12.
//  Copyright © 2018年 Aliyun.com. All rights reserved.
//

#import "UITabBarItem+TGTExtension.h"
#import "UIColor+TGTExtension.h"

@implementation UITabBarItem (TGTExtension)

+ (UITabBarItem *)tgt_tabBarItemWithTitle:(NSString *)title
                                    image:(UIImage *)image
                            selectedImage:(UIImage *)selectedImage {
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                             image:image
                                                     selectedImage:selectedImage];
    
    [tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName :  [UIColor blackColor]}
                              forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor TGT_systemLeftColor]}
                              forState:UIControlStateSelected];
    
    return tabBarItem;
}
@end
