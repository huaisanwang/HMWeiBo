//
//  HMNavigationController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/2.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMNavigationController.h"


@implementation HMNavigationController

+(void)initialize
{
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //普通状态下
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor orangeColor];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //不可用状态下得
    NSMutableDictionary *disTextAttrs=[NSMutableDictionary dictionary];
    disTextAttrs[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    disTextAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disTextAttrs forState:UIControlStateDisabled];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //NSLog(@"%d->%@",self.viewControllers.count,viewController);
    //非根控制器，则添加左右的BarButtonItem
    if (self.viewControllers.count>0) {
        //隐藏底部导航栏
        viewController.hidesBottomBarWhenPushed=YES;
        
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
        
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}
-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}
@end
