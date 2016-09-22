//
//  NSObject+Parse.h
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCodingDesc \
- (void)encodeWithCoder:(NSCoder *)aCoder {\
[self modelEncodeWithCoder:aCoder];\
}\
- (id)initWithCoder:(NSCoder *)aDecoder {\
self = [super init];\
return [self modelInitWithCoder:aDecoder];\
}\
- (NSString *)description {\
return [self modelDescription];\
}\

@interface NSObject (Parse)<YYModel, NSCoding>

+ (id)parse:(id)JSON;

@end










