//
//  HMSearchBar.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/5.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMSearchBar.h"

@implementation HMSearchBar
+(instancetype)initWithHeight:(float)height Width:(float)width
{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, width, height)];
}


-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        self.height=30;
//        search.with=300;
        self.background=[UIImage imageNamed:@"searchbar_textfield_background"];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imgView.height=30;
        imgView.with=30;
        imgView.contentMode=UIViewContentModeCenter;
        self.leftView=imgView;
        self.leftViewMode=UITextFieldViewModeAlways;
        self.font=[UIFont systemFontOfSize:15.0];
        self.placeholder=@"请输入搜索的内容！";
    }
    return self;
}

@end
