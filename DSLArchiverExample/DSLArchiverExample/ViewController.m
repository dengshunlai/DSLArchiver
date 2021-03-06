//
//  ViewController.m
//  DSLArchiver
//
//  Created by 邓顺来 on 16/6/30.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "ViewController.h"
#import "CollegeStudent.h"
#import "Cat.h"
#import "DSLArchiver.h"
#import "NSObject+DSLCoding.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)archive:(UIButton *)sender {
    CollegeStudent *student = [CollegeStudent new];
    student.age = 24;
    student.name = @"光子良";
    student.parents = @{@"mum":@"myMum",@"dad":@"myDad"};
    student.classmate = @[@"Tony",@"John",@"Mary"];
    Cat *cat = [[Cat alloc] init];
    cat.name = @"猫";
    cat.age = 3;
    student.pet = cat;
    student.size = CGSizeMake(3, 3);
    student.rect = CGRectMake(9, 9, 10, 10);
    
    CollegeStudent *student2 = [CollegeStudent new];
    student2.name = @"小红";
    student2.age = 18;
    
    NSArray *students = @[student,student2];
    
    //归档
    BOOL success = [DSLArchiver archiveObject:students key:@"students"];
    if (success) {
        NSLog(@"归档成功");
    } else {
        NSLog(@"失败");
    }
}

- (IBAction)unarchive:(UIButton *)sender {
    //解档
    NSArray *students = [DSLArchiver unarchiveWithKey:@"students"];
    
    [students[0] dsl_show];
}

@end
