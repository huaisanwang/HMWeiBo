//
//  HMDropDownMenuController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/7.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMDropDownMenuController.h"

@interface HMDropDownMenuController ()

@end

@implementation HMDropDownMenuController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (indexPath.row==0) {
        cell.textLabel.text=@"111";
    }else if(indexPath.row==1){
        cell.textLabel.text=@"222";
    }else if (indexPath.row==2){
        cell.textLabel.text=@"333";
    }
    return cell;
}
@end
