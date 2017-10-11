//
//  PackageBlockVC.m
//  BlockUsing
//
//  Created by 杜文亮 on 2017/10/11.
//  Copyright © 2017年 杜文亮. All rights reserved.
//

#import "PackageBlockVC.h"
#import "DWL_VIPAlter.h"
#import "AlterView.h"

@interface PackageBlockVC ()

@end

@implementation PackageBlockVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self systemAlter];
    [self customAlter];
}

-(void)systemAlter
{
    [DWL_VIPAlter clickChapterShowVIPAlter:^{
        NSLog(@"1111111");
    } cancelPay:^{
        NSLog(@"2222222");
    } recharge:^{
        NSLog(@"3333333");
    } vc:self];
}

-(void)customAlter
{
    AlterView *alter = [[AlterView alloc] initWithFrame:CGRectMake(0, 0, 300, 120)];
    alter.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    //    alter.tapClick = ^{
    //        NSLog(@"tap click");
    //    };
    //    alter.clicked = ^(UIButton *sender) {
    //        NSLog(@"======%ld",sender.tag);
    //    };
    [alter bangdingBlock:^(UIButton *sender) {
        NSLog(@"======%ld",sender.tag);
    } tapAction:^{
        NSLog(@"tap click");
    }];
    [self.view addSubview:alter];
}

@end
