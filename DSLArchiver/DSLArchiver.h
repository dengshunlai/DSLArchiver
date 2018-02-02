//
//  DSLArchiver.h
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSLArchiver : NSObject

/**
 归档

 @param obj 需要归档的对象
 @param key 文件名

 @return 归档是否成功是否
 */
+ (BOOL)archiveObject:(id)obj key:(NSString *)key;

/**
 解档

 @param key 文件名

 @return 解档出来的对象
 */
+ (id)unarchiveWithKey:(NSString *)key;

/**
 删除归档文件

 @param key 文件名
 @return 删除是否成功
 */
+ (BOOL)deleteWithKey:(NSString *)key;

@end
