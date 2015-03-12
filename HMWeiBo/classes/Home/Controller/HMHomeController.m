//
//  HMHomeController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/1.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMHomeController.h"
#import "HMDropDownMenu.h"
#import "HMDropDownMenuController.h"

@interface HMHomeController ()<HMDropDownMenuDelegate>

@end

@implementation HMHomeController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    UIButton *titleBtn=[[UIButton alloc] init];
    titleBtn.height=30;
    titleBtn.with=150;
//    titleBtn.backgroundColor=HWRandowColor;
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 100, 0, 0)];
    [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 50)];
    self.navigationItem.titleView=titleBtn;
    
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark --HMDropDownMenuDelegate的代理方法
-(void)dropDownMenuDidDismiss:(HMDropDownMenu *)menu
{
    UIButton *titleBtn=(UIButton *)self.navigationItem.titleView;
    titleBtn.selected=NO;
}
-(void)dropDownMenuDidShow:(HMDropDownMenu *)menu
{
    UIButton *titleBtn=(UIButton *)self.navigationItem.titleView;
    titleBtn.selected=YES;
}
-(void)titleBtnClick:(UIButton *)titleBtn
{
    
    HMDropDownMenu *menu=[HMDropDownMenu menu];
    
    //别忘了设置这个
    menu.delegate=self;
    HMDropDownMenuController *vc=[[HMDropDownMenuController alloc] init];
    vc.view.height=44*3;
    vc.view.with=150;
    menu.contentController=vc;
    [menu showFrom:titleBtn];

}

-(void)friendSearch
{
    NSLog(@"friendSearch");
}

-(void)pop
{
    NSLog(@"pop");
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
