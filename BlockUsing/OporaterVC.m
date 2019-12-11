//
//  BaseUseVC.m
//  BlockUsing
//
//  Created by Mac on 2019/11/29.
//  Copyright © 2019 杜文亮. All rights reserved.
//

#import "OporaterVC.h"


typedef void(^dwl)();//为void(^dwl)()定义一个别名dwl，使用时直接用dwl就等同于void(^dwl)()
typedef BOOL(^dwlReturn)();


@interface OporaterVC ()

@property (nonatomic,copy) dwl dwl;//声明一个dwl类型的block属性（typedef的block类型 block属性名，类似NSString *name）
//@property (nonatomic,copy) void(^dwll)();//和上面通过typedef一个block类型，再通过类型声明一个属性是一样的

@end


@implementation OporaterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //block内部可以获取外部的变量，是通过的runtime机制实现
    [self use1];
    [self use2];
    [self use3];
    
//    //测试两种声明属性的方式本质是一样的
//    _dwll = ^{
//        NSLog(@"dwll和dwl属性的声明本质是一样的！");
//    };
//    _dwll();
}

//最简单的使用（声明block，实现block内部代码，调用block）
-(void)use1
{
    //未用__block修饰代表block捕获的是局部变量的值，在block内部无法修改局部变量的值。
    int b = 0;
    
    void(^dwl)() = ^{//声明block的时候直接实现block内部代码
        NSLog(@"%d",b);
    };
    
    b = 3;//因为已经提前捕获了b的值，所以这里修改b的值，不影响block中捕获的b的值，依然是0
    dwl();//上面声明了block，这里调用block
}

//block内修改【局部变量】的值
-(void)use2
{
    /*
     *   情况一：只要是在block内部对局部变量进行了【赋值】的操作，需要使用__block关键字修饰
     */
    
    //__block修饰代表block捕获的是局部变量的内存地址，所以可以在block内部修改局部变量的值。
    __block int b = 0;
    
//    void(^dwl)() = ^{
//        b = 3;
//    };
//    dwl();
    
    //可以使用声明的block属性实现，和上面的block本质是一样的
    self.dwl = ^{
        b = 3;
    };
    self.dwl();
    
    NSLog(@"%d",b);//输出3，说明block内部修改的局部变量的值生效
    
    
    /*
     *   情况二：局部变量是可变数组、字典，不需要使用__block关键字修饰。
     
     *   因为我们只是对截获的变量进行了操作，而没有进行赋值，所以对于截获变量，可以进行操作而不可以进行赋值
     
     *   还有一点需要注意，在Block中不可以对C语言数组进行操作，原因是：～～～不支持。。。。
     */
    NSMutableArray *arr_m = [NSMutableArray arrayWithCapacity:2];
    self.dwl = ^{
        [arr_m addObject:@"ok"];
    };
    self.dwl();
    NSLog(@"%@",arr_m.firstObject);
    
    NSMutableDictionary *dic_m = [NSMutableDictionary dictionaryWithCapacity:2];
    self.dwl = ^{
        [dic_m setObject:@"gogo" forKey:@"90"];
    };
    self.dwl();
    NSLog(@"%@",dic_m[@"90"]);
    
    //下面的两种测试代码属于上述情况一，想要修改值，需要用__block修饰，写在这里这是和上面可变字典、数组的情况做对比
    //    __block NSArray *arr = [NSArray array];
    //    self.dwl = ^{
    //        arr = @[@"ki"];
    //    };
    //    self.dwl();
    //    NSLog(@"%@",arr.firstObject);
    //
    //    __block NSDictionary *dic = [NSDictionary dictionary];
    //    self.dwl = ^{
    //        dic = @{@"key":@"value"};
    //    };
    //    self.dwl();
    //    NSLog(@"%@",dic[@"key"]);
}

//解决循环引用
-(void)use3
{
    //未声明成属性的block，和控制器之前不存在循环引用
//    void(^dwl)() = ^{
//        self.view.backgroundColor = [UIColor greenColor];
//    };
//    dwl();
    
    //只有声明成属性的block才会和控制器形成循环引用的关系
//    __weak BaseUseVC *weakSelf = self; 这两句生成weakSelf的代码用哪个都行
    __weak typeof(self) weakSelf = self;
    self.dwl = ^{
        weakSelf.view.backgroundColor = [UIColor greenColor];
    };
    self.dwl();
}

/*
 *                                      总结
 1.__block不管是ARC还是MRC模式下都可以使用，可以修饰对象，还可以修饰基本数据类型。
 2.__weak只能在ARC模式下使用，也只能修饰对象（NSString），不能修饰基本数据类型（int）。
 3.__block对象可以在block中被重新赋值，_weak不可以。
 PS：_unsafe_unretained修饰符可以被视为iOS SDK 4.3以前版本的__weak的替代品，不过不会被自动置空为nil。所以尽可能不要使用这个修饰符。
 */


@end
