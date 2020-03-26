//
//  AppDelegate.m
//  ios-jump-router
//
//  Created by 黄龙山 on 2020/3/25.
//  Copyright © 2020 黄龙山. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+RouterRegister.h"
#import "ViewController.h"
#import "MineViewController.h"
#import "NaviViewController.h"

@interface AppDelegate ()

/**
 tabbar控制器
 */
@property (nonatomic, strong) UITabBarController *tabbarController;


@end

@implementation AppDelegate
#define IMG(name) [UIImage imageNamed:name]

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 路由注册
    [self registerRouteWithScheme:DefaultRouteSchema];
    
    // 配置根视图控制器
    [self setupRootController];
    
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    // 默认的路由 跳转等等
    if ([[url scheme] isEqualToString:DefaultRouteSchema]) {
        
        return [[JLRoutes routesForScheme:DefaultRouteSchema]routeURL:url];
    }
    return NO;
}


/// 初始化根页面
- (void)setupRootController
{
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    [self.window setRootViewController:self.tabbarController];
    
    [self.window makeKeyAndVisible];
}


#pragma mark - Getter
- (UITabBarController *)tabbarController
{
    if (!_tabbarController) {
        
        _tabbarController = [[UITabBarController alloc] init];
        
        
        _tabbarController.viewControllers = @[
                                              [self viewControllerWithTitle:@"首页" image:IMG(@"icon_home.png") selectImage:IMG(@"icon_home_select.png")  VC:[[ViewController alloc] init]],
                                              [self viewControllerWithTitle:@"我的" image:IMG(@"icon_cheyuan.png") selectImage:IMG(@"icon_cheyuan_select.png")  VC:[[MineViewController alloc] init]]
                                              ];
        
        
    }
    return _tabbarController;
}


-(NaviViewController *) viewControllerWithTitle:(NSString *) title image:(UIImage *)image  selectImage:(UIImage *)selectImage VC:(UIViewController *)VC{
    VC.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.title = title;
    VC.tabBarItem.title = title;
    NaviViewController *nav = [[NaviViewController alloc] initWithRootViewController:VC];
    return nav;
}

@end


