//
//  AppDelegate.h
//  ios-jump-router
//
//  Created by 黄龙山 on 2020/3/25.
//  Copyright © 2020 黄龙山. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

API_AVAILABLE(ios(13.0))
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

