//
//  ViewController.m
//  ios-jump-router
//
//  Created by 黄龙山 on 2020/3/25.
//  Copyright © 2020 黄龙山. All rights reserved.
//

#import "ViewController.h"
#import "RouterConstant.h"
#import <JLRoutes.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  yellowColor];
    
    
    UIButton *btn = [UIButton new];
    btn.bounds = CGRectMake(0, 0, 200, 50);
    btn.center = self.view.center;
    [btn setTitle:@"Common Push" forState:UIControlStateNormal];
    btn.tag = 0;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton new];
    btn1.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame)+30, 200, 50);
    [btn1 setTitle:@"StoryBoard Push" forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:btn1];
    
    
}


-(void)btnClick:(UIButton *) sender{
    if (sender.tag == 0) {
        //代参数跳转
//        NSString *router = [JLRoutes fk_generateURLWithPattern:NavPushRoute parameters:@[NSStringFromClass(ViewController.class)] extraParameters:nil];
//        [[UIApplication sharedApplication] openURL:JLRGenRouteURL(FKDefaultRouteSchema, router)];
        
        
        NSString *customURL = @"TESTDEMO://push/SecondViewController?userId=99999&age=18";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
        
        
//        TESTDEMO://push/SecondViewController
    }
    
    
    
}




@end
