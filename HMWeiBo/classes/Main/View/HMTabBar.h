//
//  HMTabBar.h
//  HMWeiBo
//
//  Created by JsonWang on 15/3/12.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMTabBar;

@protocol HMTarBarDelegate <UITabBarDelegate>

@optional
-(void)tarBarDidClickPlusButton:(UITabBar *)tarBar;

@end

@interface HMTabBar : UITabBar


@property(nonatomic,weak) UIButton *plusBtn;
@property(nonatomic,weak) id<HMTarBarDelegate> delegate;

@end
