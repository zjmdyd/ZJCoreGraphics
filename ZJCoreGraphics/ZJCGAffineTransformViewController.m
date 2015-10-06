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
    
    NSLog(@"%@", NSStringFromCGAffineTransform(self.frontView.transform));
    /*
        CGAffineTransform使用方法:
     */
#if 0
#ifdef Method1
    //方法1:
    self.frontView.transform = CGAffineTransformMakeRotation(M_PI/6);   // 弧度数, pi/6 顺时针
    
#else
    //方法2
    self.frontView.transform = CGAffineTransformRotate(self.frontView.transform, M_PI/6);
#endif
#endif
    // A point that specifies the x- and y-coordinates to transform.
    // Returns the point resulting from an affine transformation of an existing point.
    CGPointApplyAffineTransform(CGPointMake(0, 0), self.frontView.transform);   // CGPointApplyAffineTransform //把变化应用到一个点上
    
    CGRectApplyAffineTransform(CGRectMake(0, 0, 100, 100), CGAffineTransformMakeRotation(M_PI/3));
    NSLog(@"%@", NSStringFromCGAffineTransform(self.frontView.transform));
    
/*
    CTM:the current graphics state's transformation matrix
*/
}
/*
 仿射矩阵:将原坐标[x, y, 1] 转换为[x', y', 1]
    即:[x', y', 1] = [x, y, 1] x 仿射矩阵
    注意:仿射矩阵并不代表点得坐标，只是代表了一个转换关系，是一个转换矩阵而已
 struct CGAffineTransform {
    CGFloat a, b, c, d;
    CGFloat tx, ty;
 };
 
 __         __
 |  a  b  0  |
 |  c  d  0  |
 |  tx ty 1  |
 --         --
 
 一个视图的原始transform = CGAffineTransformIdentity : [1, 0, 0, 1, 0, 0]
 __      __
 |  1 0 0 |
 |  0 1 0 |
 |  0 0 1 |
 --      --
 */

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
