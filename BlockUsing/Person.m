//
//  Person.m
//  BlockUsing
//
//  Created by Mac on 2019/11/29.
//  Copyright © 2019 杜文亮. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat:(void (^)())parameterBlock {
    if (parameterBlock) {
        parameterBlock();// block的调用
    }
}

- (void)eatFruits:(void (^)(NSString * _Nonnull))parameterBlock {
    if (parameterBlock) {
        parameterBlock(@"苹果");// 带参数的block中，参数的赋值总是发生在block调用时，而在block的实现中使用参数的值
    }
}

- (void(^)())look {
    void(^lookBlock)() = ^() {
        NSLog(@"无参数、无返回值的block 作为方法的返回值");
    };
    return lookBlock;
}

- (void(^)(int))run {
    void(^runBlock)(int) = ^(int meter) {
        NSLog(@"像风走了%d万里", meter);
    };
    return runBlock;
}

- (Person *(^)(int))sleep {
    return ^(int day) {
        NSLog(@"睡了%d天", day);
        return self;
    };
}

@end
