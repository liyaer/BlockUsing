//
//  Person.h
//  BlockUsing
//
//  Created by Mac on 2019/11/29.
//  Copyright © 2019 杜文亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

//block作为参数

//无参、无返回值
- (void)eat:(void(^)())parameterBlock;
//有参、无返回值
- (void)eatFruits:(void (^)(NSString *apple))parameterBlock;


//block作为返回值

//无参、无返回值
- (void(^)())look;
//有参、无返回值 (声明时参数列表可省略形参)
- (void(^)(int))run;

//有返回值
- (Person *(^)(int))sleep;

@end

NS_ASSUME_NONNULL_END
