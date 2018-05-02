//
//  ViewController.m
//  AlgoriOS
//
//  Created by mac on 2018/4/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Algorios.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ViewController = %@ , 地址 %p ",self,&self);
    
    id cls = [Algorios class];
    
    NSLog(@"Algorios class = %@ 地址 = %p", cls, &cls);

    void *obj = &cls;
    
    NSLog(@"Void *obj = %@ 地址 = %p", obj,&obj);

    [(__bridge id)obj sark];
    
    Algorios *algor = [[Algorios alloc]init];
    
    NSLog(@"Algorios instance = %@ 地址 = %p",algor,&algor);
    
    [algor sark];
    
    __block int i = 1;
    NSLog(@"1--%d--%p",i,&i);

    void (^block)(void) = ^{
        i++;
        NSLog(@"3--%d--%p",i,&i);
    };
    i++;
    NSLog(@"2--%d--%p",i,&i);
    block();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
