# DSLArchiver
Auto archive 自动归档

简单易用的数据保存方案：
你的Model不需要做任何改动。

你只需要：
1.包含头文件
#import "DSLArchiver.h"

2.归档(保存数据)
[DSLArchiver archiveObject:student key:@"student"];

3.解档(读取数据)
[DSLArchiver unarchiveWithKey:@"student"];