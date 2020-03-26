//
//  AppDelegate+RouterRegister.h
//  ios-jump-router
//
//  Created by 黄龙山 on 2020/3/26.
//  Copyright © 2020 黄龙山. All rights reserved.
//

#import <JLRoutes.h>
#import "RouterConstant.h"


#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (RouterRegister)
- (void)registerRouteWithScheme:(NSString *)scheme;
@end

NS_ASSUME_NONNULL_END
