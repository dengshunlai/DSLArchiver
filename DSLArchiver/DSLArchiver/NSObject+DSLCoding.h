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

- (void)dsl_show;

@end
