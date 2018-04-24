//
//  Algorios.m
//  AlgoriOS
//
//  Created by mac on 2018/4/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Algorios.h"
#import <objc/runtime.h>

@implementation Algorios

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned int count = 0;
        
        Method *methods = class_copyMethodList(objc_getMetaClass(class_getName(self)), &count);
        SEL hookMethodName = NSSelectorFromString(@"hook:");
        Method hookMethod = class_getClassMethod([Algorios class], hookMethodName);

        for (int i = 0; i < count; i++) {
            Method oriMethod = methods[i];
            SEL oriMethodName = method_getName(oriMethod);
            NSLog(@"\n methodName: %@ \n",NSStringFromSelector(oriMethodName));
            
            if ([NSStringFromSelector(oriMethodName) isEqualToString:@"hook:"]) {
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
+(void)hook:(id)array{
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    [self hook:array];
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"\n (%@) time: %f s",NSStringFromSelector(_cmd),end - start);
}

@end
