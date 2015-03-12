//
//  UIView+Extension.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/2.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x=x;
    self.frame=frame;
}
-(float)x
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y=y;
    self.frame=frame;
}

-(float)y
{
    return self.frame.origin.y;
}
-(void)setMidX:(CGFloat)midX
{
    CGPoint centerPoint = self.center;
    centerPoint.x=midX;
    self.center=centerPoint;
}
-(float)midX
{
    return self.center.x;
}
-(void)setMidY:(CGFloat)midY
{
    CGPoint centerPoint = self.center;
    centerPoint.y=midY;
    self.center=centerPoint;
}
-(float)midY
{
    return self.center.y;
}
-(void)setWith:(CGFloat)with
{
    CGRect frame = self.frame;
    frame.size.width=with;
    self.frame=frame;
}

-(float)with
{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height=height;
    self.frame=frame;
}
-(float)height
{
    return self.frame.size.height;
}
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size=size;
    self.frame=frame;
}
-(CGSize)size
{
    return self.frame.size;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin=origin;
    self.origin=origin;
}
-(CGPoint)origin
{
    return self.frame.origin;
}

@end
