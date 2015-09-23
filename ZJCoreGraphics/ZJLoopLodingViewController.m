//
//  ZJLoopLodingViewController.m
//  Loop
//
//  Created by YunTu on 15/3/4.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJLoopLodingViewController.h"
#import "LoopView.h"

@interface ZJLoopLodingViewController (){
    LoopView *_loopView;
    UILabel *_percentLabel;
    BOOL _pause;
}

@end

@implementation ZJLoopLodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"加载动画";
    
    _loopView = [[LoopView alloc] initWithFrame:self.view.frame];
    _loopView.backgroundColor = [UIColor whiteColor];
    _loopView.startAngle = -M_PI_2;
    _loopView.endAngle = -M_PI_2;
    [self.view addSubview:_loopView];
    
    _percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(117, 217, 60, 60)];
    _percentLabel.text          = @"0.00%";
    _percentLabel.font          = [UIFont boldSystemFontOfSize:17];
    _percentLabel.textColor     = [UIColor whiteColor];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.layer.cornerRadius    = 30;
    _percentLabel.layer.masksToBounds   = YES;
    _percentLabel.backgroundColor       = [UIColor redColor];
    [self.view addSubview:_percentLabel];
    
    UIButton *pauseBtn = [[UIButton alloc] initWithFrame:CGRectMake(85, 380, 150, 35)];
    pauseBtn.backgroundColor = [UIColor redColor];
    [pauseBtn setTitle:@"pause" forState:UIControlStateNormal];
    [pauseBtn addTarget:self action:@selector(pause:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseBtn];
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
}

- (void)updateUI {
    if (_pause) return;
    
    [_loopView setNeedsDisplay];
    _loopView.endAngle += 10*0.05/(M_PI*2);
    if (_loopView.endAngle >= M_PI*3/2) {
        _loopView.endAngle = -M_PI_2;
    }
    _percentLabel.text = [NSString stringWithFormat:@"%.2f%@", (_loopView.endAngle+M_PI_2)/(M_PI*2)*100, @"%"];
}

- (void)pause:(UIButton *)sender {
    _pause = !_pause;
    if (_pause) {
        [sender setTitle:@"Go" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"pause" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
