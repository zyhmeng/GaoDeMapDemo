//
//  ViewController.m
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/20.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "ViewController.h"
#import "GaoDeMap/GaoDeMapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)gaoDeMap:(id)sender {
    GaoDeMapViewController *gaoDeMapVC = [[GaoDeMapViewController alloc]init];
    [self.navigationController pushViewController:gaoDeMapVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
