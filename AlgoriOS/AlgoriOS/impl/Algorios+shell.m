//
//  Algorios+shell.m
//  AlgoriOS
//
//  Created by mac on 2018/4/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Algorios+shell.h"

@implementation Algorios (shell)

+(void)shell:(NSArray **)array{
    NSMutableArray *arrM = [*array mutableCopy];
    NSInteger h = 1 ,count = arrM.count;
    
    while (h < count/3) {
        h = 3 * h + 1;
    }
    
    while (h >= 1) {
        for (NSInteger i = h; i < count; i++) {
            
            for (NSInteger j = i; j >= h && ([arrM[j] compare:arrM[j-h]] != NSOrderedDescending); j -= h) {
                [arrM exchangeObjectAtIndex:j withObjectAtIndex:j-h];
            }
        }
        h = h/3;
    }
    *array = [arrM copy];
}

@end
