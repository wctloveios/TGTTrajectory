//
//  TGTTabBarController.m
//  BlocksKit
//
//  Created by mac on 2019/1/10.
//

#import "TGTTabBarController.h"
#import <TGTMatch/TGTMatch.h>
#import <TGTLife/TGTLife.h>
#import <TGTMessage/TGTMessage.h>
#import <TGTUser/TGTUser.h>
#import <TGTCategoty/TGTCategoty.h>
#import "UIImage+TGTGlue.h"

@interface TGTTabBarController ()

@property (weak, nonatomic) UITabBarItem *tgtMatchTabBarItem;
@property (weak, nonatomic) UITabBarItem *tgtLifeTabBarItem;
@property (weak, nonatomic) UITabBarItem *tgtAddLifeTabBarItem;
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
            self.tgtAddLifeTabBarItem.title = @"";
            self.tgtMessageTabBarItem.title = @"消息";
            self.tgtUserTabBarItem.title = @"我的";
        }
    }
}

+ (UITabBarController *)rootViewControoler {
    TGTTabBarController *tabBarController = [[TGTTabBarController alloc] init];
    
    UIViewController *matchController = [[TGTMatchViewController alloc] init];
    matchController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"匹配"
                                                                  image:[UIImage tgt_glueImageName:@"tgt_math_nomal"]
                                                          selectedImage:[UIImage tgt_glueImageName:@"tgt_math_sel"]];
    tabBarController.tgtMatchTabBarItem = matchController.tabBarItem;
    
    TGTLifeViewController *lifeController = [[TGTLifeViewController alloc] init];
    lifeController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"轨迹"
                                                                image:[UIImage tgt_glueImageName:@"tgt_life_nomal"]
                                                        selectedImage:[UIImage tgt_glueImageName:@"tgt_life_sel"]];
    tabBarController.tgtLifeTabBarItem = lifeController.tabBarItem;
    
    TGTAddLifeViewController *addLifeController = [[TGTAddLifeViewController alloc] init];
    addLifeController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@""
                                                                image:[UIImage tgt_glueImageName:@"tgt_add_nomal_sel"]
                                                        selectedImage:[UIImage tgt_glueImageName:@"tgt_add_nomal_sel"]];
    tabBarController.tgtAddLifeTabBarItem = addLifeController.tabBarItem;
    tabBarController.tgtAddLifeTabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    
    TGTMessageViewController *messageController = [[TGTMessageViewController alloc] init];
    messageController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"消息"
                                                                   image:[UIImage tgt_glueImageName:@"tgt_message_nomal"]
                                                           selectedImage:[UIImage tgt_glueImageName:@"tgt_message_sel"]];
    tabBarController.tgtMessageTabBarItem = messageController.tabBarItem;
    
    TGTUserViewController *userController = [[TGTUserViewController alloc] init];
    userController.tabBarItem = [UITabBarItem tgt_tabBarItemWithTitle:@"我的"
                                                                image:[UIImage tgt_glueImageName:@"tgt_user_nomal"]
                                                        selectedImage:[UIImage tgt_glueImageName:@"tgt_user_sel"]];
    tabBarController.tgtUserTabBarItem = userController.tabBarItem;
    
    UINavigationController *matchNavController = [[UINavigationController alloc] initWithRootViewController:matchController];
    UINavigationController *lifeNavController = [[UINavigationController alloc] initWithRootViewController:lifeController];
    UINavigationController *addLifeNavController = [[UINavigationController alloc] initWithRootViewController:addLifeController];
    UINavigationController *messageNavController = [[UINavigationController alloc] initWithRootViewController:messageController];
    UINavigationController *userNavController = [[UINavigationController alloc] initWithRootViewController:userController];

    tabBarController.viewControllers = @[matchNavController, lifeNavController, addLifeNavController, messageNavController, userNavController];
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
