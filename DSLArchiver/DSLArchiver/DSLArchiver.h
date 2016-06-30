//
//  DSLArchiver.h
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+DSLCoding.h"

@interface DSLArchiver : NSObject

+ (BOOL)archiveObject:(id)obj key:(NSString *)key;
+ (id)unarchiveWithKey:(NSString *)key;

@end
