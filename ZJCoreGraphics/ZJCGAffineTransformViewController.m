//
//  ZJCGAffineTransformViewController.m
//  ZJCoreAnimation
//
//  Created by YunTu on 15/7/23.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJCGAffineTransformViewController.h"

@interface ZJCGAffineTransformViewController ()

@property (strong, nonatomic)  UIView *frontView;

@end

@implementation ZJCGAffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 2; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        view.center = self.view.center;
        if (i == 0) {
            view.backgroundColor = [UIColor redColor];
        }else {
            view.backgroundColor = [UIColor orangeColor];
            self.frontView = view;
        }
        [self.view addSubview:view];
    }
    
    self.frontView.transform = CGAffineTransformMakeRotation(M_PI/6);   // 弧度数
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
