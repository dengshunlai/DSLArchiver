//
//  NSObject+DSLCoding.h
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSLIvar.h"

@interface NSObject (DSLCoding) <NSCoding>

@property (strong, nonatomic, readonly) NSArray<DSLIvar *> *dsl_ivars;

/**
 打印self的全部变量，格式：变量名(类型) = 值
 */
- (void)dsl_show;

@end
