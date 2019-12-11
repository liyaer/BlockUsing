//
//  OprateVC.m
//  BlockUsing
//
//  Created by Mac on 2019/11/29.
//  Copyright © 2019 杜文亮. All rights reserved.
//

#import "BaseUseVC.h"
#import "Person.h"


@interface BaseUseVC ()

@end


@implementation BaseUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Xcode已经帮我们准备好了代码块，你只要输入 inl就会出现一个非常全面的block。
    
    
    //block作为属性（变量捕获、循环引用部分有）
    
    //block作为参数
    Person *p = [[Person alloc] init];
    [p eat:^{
        NSLog(@"实现一个block，作为参数，传递给eat方法");
    }];
    [p eatFruits:^(NSString * _Nonnull apple) {
        NSLog(@"使用参数：%@ 实现一个block，作为参数，传递给eatFruits方法", apple);
    }];
    
    //block作为返回值
    //原始调用方式
//    [p look]();
    //所有的不带参数，有返回值的方法。都可以用点语法，给点出来！！是不是想起什么了！！没错就是get方法！！
    p.look();
    p.run(8);
    
    //总结：以上所有的叫响应式编程！！！（包括代理，通知这些都属于响应式编程）
    //响应式编程的概念：在网上流传一个非常经典的解释“响应式编程的概念”：在程序开发中，a＝b＋c，赋值之后b或者c的值变化后，a的值不会跟着变化。响应式编程，目标就是，如果b 或者c的数值发生变化，a的数值会同时发生变化。

    
    //链式编程: block作为返回值且block本身带有返回值。没错，Masonry这个框架就是利用了链式编程思想
    p.sleep(3).sleep(6).sleep(9).run(10);
}


@end
