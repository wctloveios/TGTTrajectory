//
//  UIImage+OpenAccount.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "UIImage+OpenAccount.h"
#import "NSBundle+OpenAccount.h"

@implementation UIImage (OpenAccount)

+ (UIImage *)tgt_openAccountImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName inBundle:[NSBundle getOpenAccountBundle] compatibleWithTraitCollection:nil];
    
    return image;
}

@end
