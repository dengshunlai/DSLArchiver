//
//  DSLArchiverTests.m
//  DSLArchiverTests
//
//  Created by 邓顺来 on 16/6/30.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DSLArchiver.h"
#import "Cat.h"

@interface DSLArchiverTests : XCTestCase

@end

@implementation DSLArchiverTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testArchive {
    Cat *cat = [[Cat alloc] init];
    cat.name = @"Tom";
    cat.age = 2;
    BOOL success = [DSLArchiver archiveObject:cat key:@"my_cat"];
    XCTAssertTrue(success);
}

- (void)testUnarchive {
    Cat *cat = [[Cat alloc] init];
    cat.name = @"Avalon";
    cat.age = 1;
    [DSLArchiver archiveObject:cat key:@"my_cat"];
    
    Cat *myCat = [DSLArchiver unarchiveWithKey:@"my_cat"];
    XCTAssertTrue([cat.name isEqualToString:myCat.name]);
    XCTAssertEqual(cat.age, myCat.age);
}

- (void)testDelete {
    Cat *cat = [[Cat alloc] init];
    cat.name = @"Avalon";
    cat.age = 1;
    [DSLArchiver archiveObject:cat key:@"my_cat"];
    
    BOOL isDelete = [DSLArchiver deleteWithKey:@"my_cat"];
    XCTAssertTrue(isDelete);
    
    BOOL isUnachive = [DSLArchiver unarchiveWithKey:@"my_cat"];
    XCTAssertFalse(isUnachive);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

