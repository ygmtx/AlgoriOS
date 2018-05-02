//
//  NSArray+YM_Desc.m
//  AlgoriOS
//
//  Created by mac on 2018/4/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NSArray+YM_Desc.h"

@implementation NSArray (YM_Desc)
-(NSString *)description{
    NSMutableString *desc = [[NSMutableString alloc]init];
    for (id obj in self) {
        [desc appendFormat:@"%@,",obj];
    }
    [desc deleteCharactersInRange:NSMakeRange(desc.length-1, 1)];
    return [desc copy];
}
@end
