//
//  HMDiscoverController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/1.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMDiscoverController.h"
#import "HMSearchBar.h"

@interface HMDiscoverController ()

@end

@implementation HMDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏中添加自定义搜索框
    HMSearchBar *searchBar=[HMSearchBar initWithHeight:30 Width:300];
    self.navigationItem.titleView=searchBar;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
@end
