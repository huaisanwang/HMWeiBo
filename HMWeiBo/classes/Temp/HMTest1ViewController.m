//
//  HMTest1ViewController.m
//  HMWeiBo
//
//  Created by JsonWang on 15/3/1.
//  Copyright (c) 2015年 JsonWang. All rights reserved.
//

#import "HMTest1ViewController.h"
#import "HMTest2ViewController.h"

@interface HMTest1ViewController ()

@end

@implementation HMTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"test1";
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    HMTest2ViewController *test2=[[HMTest2ViewController alloc] init];
    test2.title=@"test2 controller";
    [self.navigationController pushViewController:test2 animated:YES];
}

@end
