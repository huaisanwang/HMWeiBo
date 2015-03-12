//
//  HMTabBar.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/12.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMTabBar.h"


@implementation HMTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *plusBtn=[[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size=plusBtn.currentBackgroundImage.size;
        plusBtn.midX=self.with*0.5;
        plusBtn.midY=self.height*0.5;
        [self addSubview:plusBtn];
        [plusBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.plusBtn=plusBtn;
    }
    
    return self;
}

-(void)plusBtnClick
{
    //通知代理
    //respondsToSelector判断是否实现了某方法
    if ([self.delegate respondsToSelector:@selector(tarBarDidClickPlusButton:)]) {
        //通知代理执行tarBarDidClickPlusButton方法
        [self.delegate tarBarDidClickPlusButton:self];
    }
}

-(void)layoutSubviews
{
    //先让系统tabBar生成
    [super layoutSubviews];
    self.plusBtn.midX=self.with*0.5;
    self.plusBtn.midY=self.height*0.5;
    //一个tabBarButton的宽度
    CGFloat tabBarButtonW = self.with/5;
    CGFloat tabBarButtonIndex=0;
    //，再覆盖里面的东西
    int count = self.subviews.count; //实际上，TABBAR中，除了自定义的5个button外，还有另外2个系统BUTTON，所以一共是7个
    //NSLog(@"%@",self.subviews);
    for (int i=0; i<count; i++) {
        UIView *child=self.subviews[i];
        Class class =NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.x=tabBarButtonIndex*tabBarButtonW;
            tabBarButtonIndex++;
            if (tabBarButtonIndex==2) {
                tabBarButtonIndex++;
            }
            child.with=self.with/5;
        }
    }
}
@end
