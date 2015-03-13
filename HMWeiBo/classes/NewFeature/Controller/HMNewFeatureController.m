//
//  HMNewFeatureController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/12.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMNewFeatureController.h"
#import "HMTabBarController.h"

#define imgcount 4

@implementation HMNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加UIScrollView
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.userInteractionEnabled=YES;
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
        //在最后一个imageView上添加按钮
        if (i==imgcount-1) {
            [self addShareBtn:imageView];
        }
        
    }
    
    scrollView.contentSize=CGSizeMake(imgcount*scrollW, 0);
    scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;//禁止来回弹动
    scrollView.showsHorizontalScrollIndicator=NO; //隐藏水平滚动条
    scrollView.delegate=self;
    
    //添加UIPageControl
    UIPageControl *pageControll = [[UIPageControl alloc] init];
    pageControll.numberOfPages=4;
    //只要该控件不存在宽高，就没有点击事件，下面几行代码可省略
//    pageControll.height=50; //此控件高度不需要设置
//    pageControll.with=100;
//    pageControll.userInteractionEnabled=no;
    pageControll.midX=scrollW*0.5;
    pageControll.midY=scrollView.height-50;
    pageControll.currentPageIndicatorTintColor=[UIColor redColor];
    pageControll.pageIndicatorTintColor=[UIColor grayColor];
    [self.view addSubview:pageControll];
    self.pageControll=pageControll;
}
#pragma mark -添加按钮
-(void)addShareBtn:(UIImageView *)imageView
{
    imageView.userInteractionEnabled=YES; //不添加的话，按钮事件无法传递
    //添加分享按钮
    UIButton *shareBtn =[[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    shareBtn.with=150;
    shareBtn.height=30;
    shareBtn.midX=imageView.with*0.5;
    shareBtn.midY=imageView.height*0.65;
    [imageView addSubview:shareBtn];
    [shareBtn addTarget:self action:@selector(sharBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //设置内边距
    shareBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    //添加开始微博按钮
    UIButton *startBlogBtn=[[UIButton alloc] init];
    [startBlogBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBlogBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBlogBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    startBlogBtn.size=startBlogBtn.currentBackgroundImage.size;
    startBlogBtn.midX=shareBtn.midX;
    startBlogBtn.midY=imageView.height*0.75;
    [imageView addSubview:startBlogBtn];
    [startBlogBtn addTarget:self action:@selector(startBlogBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)sharBtnClick:(UIButton *)shareBtn
{
    shareBtn.selected=!shareBtn.isSelected;
}
-(void)startBlogBtnClick
{
    //进入到主窗口，最好使用rootViewController切换控制器
    //如果使用modal或者navgation.push,新特性控制器则会一直驻留在内存中(dealloc方法不会调用)，如：
//    [self presentViewController:[[HMTabBarController alloc] init] animated:YES completion:nil];
    UIWindow *window = [UIApplication sharedApplication].keyWindow; //找到应用程序主窗口
    //dealloc()方法会调用
    window.rootViewController=[[HMTabBarController alloc] init];
}
-(void)dealloc
{
    NSLog(@"dealloc........");
}
#pragma mark - UIScrollViewDelegate代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float page = scrollView.contentOffset.x/scrollView.with;
    self.pageControll.currentPage=(int)page;
}


@end
