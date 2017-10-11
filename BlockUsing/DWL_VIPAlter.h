//
//  DWL_VIPAlter.h
//  LHNewReader
//
//  Created by 杜文亮 on 2017/9/27.
//  Copyright © 2017年 Su Lei Han. All rights reserved.
//


/*
 *   同样都是封装成一个包含block的方法，注意和下面自定义alter中封装成block方法的区别。
 
 *   这里我们可以直接通过构造含有block参数的方法，将block以形参的形式传递到方法内部；
 
 *   但是下面自定义alter中，因为我们是将点击事件封装成block，block肯定是要在点击事件中进行回调，而点击事件本来就是个方法，并且点击事件写法是固定的，只能是无参数或者UIButton类型的参数，无法扩展方法，所以也就无法直接构造含block参数的方法将block以形参形式传递。因此我们只能通过block属性来间接的将外界block的实现和我们内部属性block进行绑定，然后在点击事件中，通过内部block属性对外界block进行调用
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^alterClickedHandler)();


@interface DWL_VIPAlter : NSObject

+(void)clickChapterShowVIPAlter:(alterClickedHandler)pay cancelPay:(alterClickedHandler)cancelPay recharge:(alterClickedHandler)recharge vc:(UIViewController *)vc;

@end
