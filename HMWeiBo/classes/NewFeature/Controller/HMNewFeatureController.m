//
//  HMNewFeatureController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/12.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMNewFeatureController.h"

#define imgcount 4

@interface HMNewFeatureController ()

@end

@implementation HMNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加UIScrollView
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.size=self.view.size;
    [self.view addSubview:scrollView];
    //add image
    CGFloat scrollW=scrollView.with;
    for (int i=0; i<imgcount; i++) {
        UIImageView *imageView =[[UIImageView alloc] init];
        NSString *name =[NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image=[UIImage imageNamed:name];
        imageView.with=scrollW;
        imageView.height=scrollView.height;
        imageView.x=scrollW*i;
        [scrollView addSubview:imageView];
    }
    
    
    scrollView.contentSize=CGSizeMake(imgcount*scrollW, 0);
    scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;//禁止来回弹动
    scrollView.showsHorizontalScrollIndicator=NO; //隐藏水平滚动条
    
    //添加UIPageControl
    UIPageControl *pageControll = [[UIPageControl alloc] init];
    pageControll.numberOfPages=4;
//    pageControll.height=50; //此控件高度不需要设置
    pageControll.with=100;
    pageControll.midX=scrollW*0.5;
    pageControll.midY=scrollView.height-50;
    pageControll.currentPageIndicatorTintColor=[UIColor redColor];
    pageControll.pageIndicatorTintColor=[UIColor grayColor];
    [self.view addSubview:pageControll];
}


@end
