//
//  AlterView.h
//  BlockUsing
//
//  Created by 杜文亮 on 2017/10/11.
//  Copyright © 2017年 杜文亮. All rights reserved.
//


/*
 *   这里演示了block的属性、方法两种调用方式
 
 *   如果只有一个block，那么使用属性和方法都可以；如果有多个block，推荐使用方法，这样外界调用代码看起来简洁（这里和我们给模型赋值时，可以使用属性set方法赋值，也可以写一个统一的赋值方法是完全类似的，构造方法的目的都是为了外界调用的简洁性）
 */

#import <UIKit/UIKit.h>


typedef void(^btnClickAction)(UIButton *sender);
typedef void(^tapAction)();


@interface AlterView : UIView

@property (nonatomic,copy) btnClickAction clicked;
@property (nonatomic,copy) tapAction tapClick;

-(void)bangdingBlock:(btnClickAction)clicked tapAction:(tapAction)tapClick;

@end
