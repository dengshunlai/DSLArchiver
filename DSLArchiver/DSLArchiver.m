//
//  DSLArchiver.m
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DSLArchiver.h"

@implementation DSLArchiver

+ (BOOL)archiveObject:(id)obj key:(NSString *)key
{
    NSString *path = [self pathWithKey:key];
    
    return [NSKeyedArchiver archiveRootObject:obj toFile:path];
}

+ (id)unarchiveWithKey:(NSString *)key
{
    NSString *path = [self pathWithKey:key];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

+ (BOOL)deleteWithKey:(NSString *)key
{
    NSString *path = [self pathWithKey:key];
    NSFileManager *fileMananger = [NSFileManager defaultManager];
    return [fileMananger removeItemAtPath:path error:nil];
}

+ (NSString *)pathWithKey:(NSString *)key
{
    NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSFileManager *fileMananger = [NSFileManager defaultManager];
    NSString *archiverDirectory = [document stringByAppendingPathComponent:@"DSLArchiver"];
    if (![fileMananger fileExistsAtPath:archiverDirectory isDirectory:nil]) {
        [fileMananger createDirectoryAtPath:archiverDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [archiverDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",key]];
}

@end
