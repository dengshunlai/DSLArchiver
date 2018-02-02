//
//  NSObject+DSLCoding.m
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSObject+DSLCoding.h"
#import <objc/runtime.h>

@implementation NSObject (DSLCoding)

@dynamic dsl_ivars;

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        [self.dsl_ivars enumerateObjectsUsingBlock:^(DSLIvar * ivar, NSUInteger idx, BOOL * stop) {
            if ([aDecoder containsValueForKey:ivar.name]) {
                [self setValue:[aDecoder decodeObjectForKey:ivar.name] forKey:ivar.name];
            }
        }];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self.dsl_ivars enumerateObjectsUsingBlock:^(DSLIvar * ivar, NSUInteger idx, BOOL * stop) {
        [aCoder encodeObject:[self valueForKey:ivar.name] forKey:ivar.name];
    }];
}

- (void)dsl_show
{
    NSArray *ivars = self.dsl_ivars;
    NSMutableString *str = @"\n".mutableCopy;
    [ivars enumerateObjectsUsingBlock:^(DSLIvar *ivar, NSUInteger idx, BOOL * stop) {
        [str appendFormat:@"%@(%@) = %@\n",ivar.name,ivar.type,[self valueForKey:ivar.name]];
    }];
    NSLog(@"%@",str);
}

- (NSArray<DSLIvar *> *)dsl_ivars
{
    NSMutableArray *ivars = @[].mutableCopy;
    [ivars addObjectsFromArray:[self dsl_ivarsWithClass:[self class]]];
    
    Class superClass = class_getSuperclass([self class]);
    while (superClass != [NSObject class]) {
        [ivars addObjectsFromArray:[self dsl_ivarsWithClass:superClass]];
        superClass = class_getSuperclass(superClass);
    }
    
    return ivars;
}

- (NSArray *)dsl_ivarsWithClass:(Class)clazz
{
    NSMutableArray *ivars;
    ivars = [[DSLIvarsCache sharedInstance].cache objectForKey:NSStringFromClass(clazz)];
    if (ivars) {
        return ivars;
    }
    
    ivars = @[].mutableCopy;
    unsigned int count = 0;
    Ivar *ivar_list = class_copyIvarList(clazz, &count);
    for (int i = 0; i < count; i++) {
        const char *ivar_name = ivar_getName(ivar_list[i]);
        const char *ivar_type = ivar_getTypeEncoding(ivar_list[i]);
        DSLIvar *ivar = [DSLIvar new];
        ivar.name = [NSString stringWithCString:ivar_name encoding:NSUTF8StringEncoding];
        ivar.type = [NSString stringWithCString:ivar_type encoding:NSUTF8StringEncoding];
        ivar.type = [ivar.type stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        [ivars addObject:ivar];
    }
    free(ivar_list);
    [[DSLIvarsCache sharedInstance].cache setObject:ivars forKey:NSStringFromClass(clazz)];
    
    return ivars;
}

- (id)valueForUndefinedKey:(NSString *)key {
#ifdef DEBUG
    NSLog(@"\n%@: %@->%@",@"valueForUndefinedKey",[self class],key);
#endif
    return @"valueForUndefinedKey";
}

@end
