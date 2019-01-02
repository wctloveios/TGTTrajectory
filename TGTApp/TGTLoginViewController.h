//
//  TGTLoginViewController.h
//  TGTApp
//
//  Created by mac on 2019/1/2.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TGTLoginType) {
    TGTLoginTypeRegister,
    TGTLoginTypeLogin,
};

@interface TGTLoginViewController : UIViewController

@property (nonatomic, assign) TGTLoginType loginType;

@end

NS_ASSUME_NONNULL_END
