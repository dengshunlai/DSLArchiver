# DSLArchiver
Auto archive 自动归档

简单易用的数据保存方案：
你的Model不需要做任何改动。
不需要手动实现归档协议。

使用方法：
```
1.包含头文件
#import "DSLArchiver.h"
2.归档(保存数据)
[DSLArchiver archiveObject:students key:@"students"];
3.解档(读取数据)
[DSLArchiver unarchiveWithKey:@"students"];
```
