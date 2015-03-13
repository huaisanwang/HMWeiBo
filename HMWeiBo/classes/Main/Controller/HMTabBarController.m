//
//  HMTabBarController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/1.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMTabBarController.h"
#import "HMHomeController.h"
#import "HMDiscoverController.h"
#import "HMMessageCenterController.h"
#import "HMProfileController.h"
#import "HMNavigationController.h"
#import "HMTabBar.h"

@interface HMTabBarController ()<HMTarBarDelegate>

@end

@implementation HMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HMHomeController *home=[[HMHomeController alloc] init];
    [self addChildViewController:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    HMMessageCenterController *messageCenter=[[HMMessageCenterController alloc] init];
    [self addChildViewController:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    HMDiscoverController *discover=[[HMDiscoverController alloc] init];
    [self addChildViewController:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    HMProfileController *profile=[[HMProfileController alloc] init];
    [self addChildViewController:profile title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
//    //更换系统自带的 tabBar,而在此之前addChildViewController已经创建tabBar
    HMTabBar *tabBar =[[HMTabBar alloc] init];
//    //这里代理其实可以不用设置，因为后面addChild时已经有默认的代理了
//    tabBar.delegate=self;
//    NSLog(@"%@",self.delegate);
//    //forKeyPath包含了forKey的功能，这里用forkeyPath也一样
//    //keypath 可以利用点运算符 来进行层级结构，如：[ self setvalue:@"wangcai" forKeyPath('persoin1.dog.name')];
    //进行更换，这里使用KVC模式，因为修改的是系统的readonly属性，即系统的tabBar@property(nonatomic,readonly) UITabBar *tabBar
    [self setValue:tabBar forKey:@"tabBar"];

}
#pragma mark 实现代理方法
-(void)tarBarDidClickPlusButton:(UITabBar *)tarBar
{
    UIViewController *vc=[[UIViewController alloc] init];
    vc.view.backgroundColor=[UIColor grayColor];
    [self presentViewController:vc animated:YES completion:nil];
}


#pragma mark - 自定义为TabBar添加控制器
-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childController.title=title;
    
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=HWColor(123,123,123);
    NSMutableDictionary *selectTextAttrs=[NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName]=[UIColor orangeColor];
    //设置tarBarItem
    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    childController.tabBarItem.image=[UIImage imageNamed:image];
    childController.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    HMNavigationController *nav =[[HMNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
}

@end
