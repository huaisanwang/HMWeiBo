//
//  HMMessageCenterController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/1.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMMessageCenterController.h"
#import "HMTest1ViewController.h"

@interface HMMessageCenterController ()
@end

@implementation HMMessageCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注意：style属性在IOS7之后基本没区别，都使扁平化设置
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:self action:@selector(composeMsg)];
    self.navigationItem.rightBarButtonItem.enabled=NO;
}

-(void)composeMsg
{
    NSLog(@"ponseMsg");
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"message->%d",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMTest1ViewController *test1=[[HMTest1ViewController alloc] init];
//    test1.navigationItem.title=@"test";
//    test1.title=@"test1coer";
//    test1.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:test1 animated:YES];
}

@end
