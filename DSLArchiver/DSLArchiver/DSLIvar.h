//
//  DSLIvar.h
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSLIvar : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;

@end

@interface DSLIvarsCache : NSObject

@property (strong, nonatomic) NSCache *cache;

+ (instancetype)sharedInstance;

@end
