//
//  AlterView.m
//  BlockUsing
//
//  Created by 杜文亮 on 2017/10/11.
//  Copyright © 2017年 杜文亮. All rights reserved.
//

#import "AlterView.h"

@implementation AlterView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor brownColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(anotherBlock)];
        [self addGestureRecognizer:tap];
        
        for (int i = 0; i < 3; i++)
        {
            UIButton *btn = [UIButton buttonWithType:1];
            btn.frame = CGRectMake(0, 40 *(i%3), 100, 40);
            btn.tag = i +100;
            [btn addTarget:self action:@selector(useBlock:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:[NSString stringWithFormat:@"这是第%ld个按钮",btn.tag] forState:UIControlStateNormal];
            [self addSubview:btn];
        }
    }
    return self;
}

-(void)anotherBlock
{
    if (self.tapClick)
    {
        self.tapClick();
    }
}

-(void)useBlock:(UIButton *)sender
{
    if (self.clicked)
    {
        self.clicked(sender);
    }
}

-(void)bangdingBlock:(btnClickAction)clicked tapAction:(tapAction)tapClick
{
    self.clicked = clicked;
    self.tapClick = tapClick;
}

@end
