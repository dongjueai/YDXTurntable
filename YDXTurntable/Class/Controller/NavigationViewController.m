//
//  ViewController.m
//  YDXTurntable
//
//  Created by LIN on 16/11/26.
//  Copyright © 2016年 YDX. All rights reserved.
//

#import "NavigationViewController.h"
#import "TurntableViewController1.h"
#import "TurntableViewController2.h"


@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI{
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 50)];
    [button1 setTitle:@"一键点击转盘" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor cyanColor];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 120, 50)];
    [button2 setTitle:@"手动转动转盘" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor magentaColor];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
}

- (void)button1Click{
    
    TurntableViewController1 * vc = [[TurntableViewController1 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)button2Click{
    
    TurntableViewController2 * vc = [[TurntableViewController2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
