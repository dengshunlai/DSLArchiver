//
//  Person.h
//  DSLArchiverDemo
//
//  Created by 邓顺来 on 16/6/25.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Cat.h"

@interface Person : NSObject
{
    BOOL _gender;
}

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (strong, nonatomic) Cat *pet;

- (void)setParents:(NSDictionary *)parents;
- (NSDictionary *)parents;

@end
