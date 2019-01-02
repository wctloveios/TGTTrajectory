//
//  UIButton+WCTButtonExtension.h
//  TestWCTAllCategory
//
//  Created by mac on 2018/5/23.
//  Copyright © 2018年 mac. All rights reserved.
//  

#import <UIKit/UIKit.h>

//The author：WCT
@interface UIButton (WCTButtonExtension)

/**
 增加button点击范围
 
 @param top 上边增加像素
 @param right 右边增加像素
 @param bottom 下边增加像素
 @param left 左边增加像素
 */
- (void)WCT_enlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
