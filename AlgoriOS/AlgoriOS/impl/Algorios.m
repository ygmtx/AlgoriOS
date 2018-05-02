//
//  Algorios.m
//  AlgoriOS
//
//  Created by mac on 2018/4/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Algorios.h"
#import <objc/runtime.h>
#import "NSArray+YM_Desc.h"

@implementation Algorios

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned int count = 0;
        
        Method *methods = class_copyMethodList(objc_getMetaClass(class_getName(self)), &count);
        SEL hookMethodName = NSSelectorFromString(@"ym_hook:");
        Method hookMethod = class_getClassMethod([Algorios class], hookMethodName);

        for (int i = 0; i < count; i++) {
            Method oriMethod = methods[i];
            SEL oriMethodName = method_getName(oriMethod);
            
            if (![NSStringFromSelector(oriMethodName) containsString:@"ym"]) {
                break;
            }

            BOOL isAdd = NO;
            isAdd = class_addMethod(objc_getMetaClass(class_getName(self)), oriMethodName, method_getImplementation(hookMethod), method_getTypeEncoding(hookMethod));
            if (isAdd) {
                class_replaceMethod(objc_getMetaClass(class_getName(self)), hookMethodName, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
            }else{
                method_exchangeImplementations(oriMethod, hookMethod);
            }
        }
        free(methods);
    });
}

//The execution time
+(void)ym_hook:(NSArray **)array{
    NSAssert(*array != nil && [*array count] != 0, @"array==nil or count==0");

    NSLog(@"\n(%@)\nstart:...\n%@",NSStringFromSelector(_cmd),*array);
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    [self ym_hook:array];
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"\n(%@)function timing: %f s\n%@\n...end",NSStringFromSelector(_cmd),end-start,*array);
}

-(void)sark{
    NSLog(@"Myname is %@",self.name);
}

@end
