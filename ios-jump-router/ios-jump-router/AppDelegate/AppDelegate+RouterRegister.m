//
//  AppDelegate+RouterRegister.m
//  ios-jump-router
//
//  Created by 黄龙山 on 2020/3/26.
//  Copyright © 2020 黄龙山. All rights reserved.
//

#import "AppDelegate+RouterRegister.h"
#import <objc/runtime.h>


@implementation AppDelegate (RouterRegister)
#pragma mark - 路由注册
#pragma mark - 普通的跳转路由注册
- (void)registerRouteWithScheme:(NSString *)scheme
{
    //DefaultRouteSchema://push/FirstNextViewController
    [[JLRoutes routesForScheme:scheme] addRoute:@"/push/:controller"handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        Class class = NSClassFromString(parameters[@"controller"]);
        
        UIViewController *nextVC = [[class alloc] init];
        
        [self _paramToVc:nextVC param:parameters];
        UIViewController *currentVc = [self _currentViewController];
        [currentVc.navigationController pushViewController:nextVC animated:YES];
        return YES;
    }];
    
}


#pragma mark - Private
/// 处理跳转事件
-(void)_paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    //        runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}

/// 获取当前控制器
- (UIViewController *)_currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}
@end
