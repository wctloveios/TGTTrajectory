//
//  TGTVerCodeViewController.h
//  BlocksKit
//
//  Created by mac on 2019/1/5.
//

#import <UIKit/UIKit.h>
#import "TGTOpenAccountMarco.h"

NS_ASSUME_NONNULL_BEGIN

@interface TGTVerCodeViewController : UIViewController

@property (nonatomic, assign) TGTLoginType tgtLoginType;
//注册时需要
@property (nonatomic, strong) NSString *iPhoneStr;

@end

NS_ASSUME_NONNULL_END
