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
    CollegeStudent *person = [CollegeStudent new];
    person.age = 25;
    person.name = @"光子良";
    person.parents = @{@"mum":@"myMum",@"dad":@"myDad"};
    person.classmate = @[@"Tony",@"John",@"Mary"];
    Cat *cat = [[Cat alloc] init];
    cat.name = @"猫";
    cat.age = 2;
    person.pet = cat;
    person.size = CGSizeMake(3, 3);
    person.rect = CGRectMake(9, 9, 10, 10);
    
    [person dsl_show];
    
    //归档
    [DSLArchiver archiveObject:person key:@"student"];
}

- (IBAction)unarchive:(UIButton *)sender {
    //解档
    CollegeStudent *person2 = [DSLArchiver unarchiveWithKey:@"student"];
    [person2 dsl_show];
}

@end
