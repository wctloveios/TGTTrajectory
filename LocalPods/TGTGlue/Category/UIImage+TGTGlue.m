//
//  UIImage+OpenAccount.m
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import "UIImage+TGTGlue.h"
#import "NSBundle+TGTGlue.h"

@implementation UIImage (TGTGlue)

+ (UIImage *)tgt_glueImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName inBundle:[NSBundle getGuleBundle] compatibleWithTraitCollection:nil];
    
    return image;
}

@end
