//
//  NSObject+Parse.m
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

+ (id)parse:(id)JSON{
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]] ||[JSON isKindOfClass:[NSString class]]||[JSON isKindOfClass:[NSData class]]) {
        return [self modelWithJSON:JSON];
    }
    
    return JSON;
}

@end





