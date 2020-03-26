//
//  RouterConstant.m
//  ios-jump-router
//
//  Created by 黄龙山 on 2020/3/26.
//  Copyright © 2020 黄龙山. All rights reserved.
//

#import "RouterConstant.h"

NSString *const FKControllerNameRouteParam = @"viewController";

#pragma mark - 路由模式

NSString *const DefaultRouteSchema = @"TESTDEMO";
NSString *const HTTPRouteSchema = @"http";
NSString *const HTTPsRouteSchema = @"https";
// ----
NSString *const ComponentsCallBackHandlerRouteSchema = @"AppCallBack";
NSString *const WebHandlerRouteSchema = @"yinzhi";
NSString *const UnknownHandlerRouteSchema = @"UnKnown";

#pragma mark - 路由表

NSString *const NavPushRoute = @"/navPush:viewController";
NSString *const NavPresentRoute = @"/navPresent/:viewController";
NSString *const NavStoryBoardPushRoute = @"/navStoryboardPush/:viewController";
NSString *const ComponentsCallBackRoute = @"/callBack/*";
