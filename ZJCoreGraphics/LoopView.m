//
//  LoopView.m
//  Loop
//
//  Created by YunTu on 15/3/4.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "LoopView.h"

@implementation LoopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGPoint center = CGPointMake(150, 250);
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path addArcWithCenter:center radius:80 startAngle:-M_PI_2 endAngle:M_PI*3/2 clockwise:YES];
    [[UIColor redColor] setStroke];
    path.lineWidth = 10;
    [path stroke];
    [path closePath];
    
    UIBezierPath *path2 = [[UIBezierPath alloc]init];
    [path2 addArcWithCenter:center radius:80 startAngle:self.startAngle endAngle:self.endAngle clockwise:YES];
    [[UIColor orangeColor] setStroke];
    path2.lineWidth = 10;
    [path2 stroke];
    [path2 closePath];
    
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:center];
    [path3 addArcWithCenter:center radius:66 startAngle:-M_PI_2 endAngle:self.endAngle clockwise:YES];
    if (self.endAngle > -M_PI_2) {
        [[UIColor blueColor] setStroke];
        [[UIColor blueColor] setFill];
        [path3 stroke];
        [path3 fill];
    }
    [path3 closePath];
    
    CGContextRestoreGState(context);
}


@end
