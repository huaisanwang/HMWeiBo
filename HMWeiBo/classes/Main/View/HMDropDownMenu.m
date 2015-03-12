//
//  HMDropDownMenu.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/7.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMDropDownMenu.h"


@implementation HMDropDownMenu
#pragma mark -- 懒加载——也称为延迟加载，即在需要的时候才加载（效率低，占用内存小）。
//所谓懒加载，写的是其get方法.
-(UIImageView *)containerView
{
    if (!_containerView) {
        UIImageView *contentView=[[UIImageView alloc] init];
        contentView.image=[UIImage imageNamed:@"popover_background"];
//        contentView的宽高由外部确定
//        contentView.height=300;
//        contentView.with=217;
        contentView.userInteractionEnabled=YES;
        [self addSubview:contentView];
        _containerView=contentView;
    }
    return _containerView;
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
+(instancetype)menu
{
   return [[self alloc] init];
}

-(void)setContent:(UIView *)content
{
    _content=content;
    //调整containerView内部控件的位置
    content.x=10;
    content.y=15;
    //内部控件的宽度不能由外部设置，所以用户可随便填写值，这里我们固定死；高度用户可以自定义
//    content.with=self.containerView.with-2*content.x;
    self.containerView.with=CGRectGetMaxX(content.frame)+10;
    self.containerView.height=CGRectGetMaxY(content.frame)+10;
    [self.containerView addSubview:content];
}

-(void)setContentController:(UIViewController *)contentController
{
    _contentController=contentController;
    self.content=contentController.view;
}

-(void)showFrom:(UIView *)from
{
    UIWindow *window=[UIApplication sharedApplication].windows.lastObject;
    self.frame=window.bounds;
    [window addSubview:self];
    //调整containerView位置,这两个值不能固定死，要以传过来的控件相关
    //from控件是_containerView的子控件，所以可以利用子控件的x,y确定父控件的X,Y
    CGRect newFrom = [from convertRect:from.bounds toView:window];
    _containerView.y=newFrom.origin.y+from.size.height;
    _containerView.midX = CGRectGetMidX(newFrom);
    
    if ([self.delegate respondsToSelector:@selector(dropDownMenuDidShow:)]) {
        [self.delegate dropDownMenuDidShow:self];
    }
}
-(void)dismiss
{
    [self removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(dropDownMenuDidDismiss:)]) {
        [self.delegate dropDownMenuDidDismiss:self];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}
@end
