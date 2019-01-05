//
//  TGTOpenAccountMarco.h
//  TGTOpenAccountMarco
//
//  Created by chuntao.wang1 on 2018/12/17.
//  Copyright © 2018年 chuntao.wang1. All rights reserved.
//

#ifndef TGTOpenAccountMarco_h
#define TGTOpenAccountMarco_h

//颜色内联
static inline UIColor *TGTOpenAccount_RGBA(CGFloat r, CGFloat g, CGFloat b) {
    return [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(1)];
}

//登录注册页面顶部logoView高度
static CGFloat const tgtTopLogoViewHeight = 200;
//第一个元素距离顶部logoView底部间距
static CGFloat const tgtPhoneIconToTopLogoViewBottom = 30;

typedef NS_ENUM(NSInteger, TGTLoginType) {
    TGTLoginTypeLogin,
    TGTLoginTypeRegister,
};

#endif /* TGTOpenAccountMarco_h */
