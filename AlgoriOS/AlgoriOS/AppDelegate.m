//
//  AppDelegate.m
//  AlgoriOS
//
//  Created by mac on 2018/4/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "Algorios+shell.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *arr = @[@5,@11,@7,@9,@2,@3,@12,@8,@6,@1,@4,@10];
//
    [Algorios ym_shell:&arr];
    
    return YES;
}


@end
