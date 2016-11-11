//
//  DSLIvar.m
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DSLIvar.h"

@implementation DSLIvar

- (NSString *)description
{
    return [NSString stringWithFormat:@"ivar_name:%@ , ivar_type:%@",_name,_type];
}

@end

static DSLIvarsCache *_sharedInstance;

@interface DSLIvarsCache ()

@end

@implementation DSLIvarsCache

+ (instancetype)sharedInstance
{
    if (!_sharedInstance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _sharedInstance = [[DSLIvarsCache alloc] init];
        });
    }
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cache = [[NSCache alloc] init];
    }
    return self;
}

@end
