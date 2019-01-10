//
//  TGTTabBarController.m
//  BlocksKit
//
//  Created by mac on 2019/1/10.
//

#import "TGTTabBarController.h"
#import <TGTMatch/TGTMatchViewController.h>
#import <TGTLife/TGTLifeViewController.h>
#import <TGTMessage/TGTMessageViewController.h>
#import <TGTUser/TGTUserViewController.h>
#import <TGTCategoty/TGTCategoty.h>

@interface TGTTabBarController ()

@property (weak, nonatomic) UITabBarItem *tgtMatchTabBarItem;
@property (weak, nonatomic) UITabBarItem *tgtLifeTabBarItem;
@property (weak, nonatomic) UITabBarItem *tgtMessageTabBarItem;
@property (weak, nonatomic) UITabBarItem *tgtUserTabBarItem;

@end

@implementation TGTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc {
    [self.tabBar removeObserver:self forKeyPath:@"hidden"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"hidden"]) {
        BOOL newValue = [change[NSKeyValueChangeNewKey] boolValue];
        if (newValue == false) {
            self.tgtMatchTabBarItem.title = @"匹配";
            self.tgtLifeTabBarItem.title = @"轨迹";
            self.tgtMessageTabBarItem.title = @"消息";
            self.tgtUserTabBarItem.title = @"我的";
        }
    }
}

+ (UITabBarController *)rootViewControoler {
    TGTTabBarController *tabBarController = [[TGTTabBarController alloc] init];
    
    UIViewController *matchController = [[TGTMatchViewController alloc] init];
    matchController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"匹配"
                                                                  image:nil
                                                          selectedImage:nil];
    tabBarController.tgtMatchTabBarItem = matchController.tabBarItem;
    
    TGTLifeViewController *lifeController = [[TGTLifeViewController alloc] init];
    lifeController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"轨迹"
                                                                  image:nil
                                                          selectedImage:nil];
    tabBarController.tgtLifeTabBarItem = lifeController.tabBarItem;
    
    TGTMessageViewController *messageController = [[TGTMessageViewController alloc] init];
    messageController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"消息"
                                                                image:nil
                                                        selectedImage:nil];
    tabBarController.tgtMessageTabBarItem = messageController.tabBarItem;
    
    TGTUserViewController *userController = [[TGTUserViewController alloc] init];
    userController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"我的"
                                                                image:nil
                                                        selectedImage:nil];
    tabBarController.tgtUserTabBarItem = userController.tabBarItem;
    
    UINavigationController *matchNavController = [[UINavigationController alloc] initWithRootViewController:matchController];
    UINavigationController *lifeNavController = [[UINavigationController alloc] initWithRootViewController:lifeController];
    UINavigationController *messageNavController = [[UINavigationController alloc] initWithRootViewController:messageController];
    UINavigationController *userNavController = [[UINavigationController alloc] initWithRootViewController:userController];

    tabBarController.viewControllers = @[matchNavController, lifeNavController, messageNavController, userNavController];
    //解决tabbar从二级页面切回来出现跳动问题
    [[UITabBar appearance] setTranslucent:NO];
    
    return tabBarController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
