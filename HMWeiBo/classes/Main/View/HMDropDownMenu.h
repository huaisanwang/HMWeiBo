//
//  HMDropDownMenu.h
//  HMWeiBo
//
//  Created by JsonWang on 15/3/7.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMDropDownMenu;

@protocol HMDropDownMenuDelegate <NSObject>
@optional
-(void)dropDownMenuDidDismiss:(HMDropDownMenu *)menu;
-(void)dropDownMenuDidShow:(HMDropDownMenu *)menu;
@end

@interface HMDropDownMenu : UIView

@property(nonatomic,weak) id<HMDropDownMenuDelegate> delegate;

+(instancetype)menu;
-(void)showFrom:(UIView *)from;
-(void)dismiss;

@property(nonatomic,strong) UIImageView *containerView;
@property(nonatomic,strong) UIView *content;
@property(nonatomic,strong) UIViewController *contentController;
@end
