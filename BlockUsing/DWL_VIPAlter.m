//
//  DWL_VIPAlter.m
//  LHNewReader
//
//  Created by 杜文亮 on 2017/9/27.
//  Copyright © 2017年 Su Lei Han. All rights reserved.
//

#import "DWL_VIPAlter.h"

@implementation DWL_VIPAlter

+(void)clickChapterShowVIPAlter:(alterClickedHandler)pay cancelPay:(alterClickedHandler)cancelPay recharge:(alterClickedHandler)recharge vc:(UIViewController *)vc
{    
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"封装系统Alter" message:@"niu B!" preferredStyle:UIAlertControllerStyleAlert];
    [alter addAction:[UIAlertAction actionWithTitle:@"One" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
      {
          pay();
      }]];
    [alter addAction:[UIAlertAction actionWithTitle:@"Two" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
      {
          cancelPay();
      }]];
    [alter addAction:[UIAlertAction actionWithTitle:@"Three" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
      {
          recharge();
      }]];
    [vc presentViewController:alter animated:YES completion:nil];
}

@end
