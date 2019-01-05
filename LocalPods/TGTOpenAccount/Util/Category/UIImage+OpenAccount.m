//
//  UIImage+OpenAccount.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "UIImage+OpenAccount.h"
#import "NSBundle+OpenAccount.h"

@implementation UIImage (OpenAccount)

+ (UIImage *)tgt_imageName:(NSString *)imageName {
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle getOpenAccountBundle] pathForResource:imageName ofType:@"png"]];
    
    return image;
}

@end
