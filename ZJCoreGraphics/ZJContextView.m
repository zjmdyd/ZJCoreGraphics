//
//  ZJContextView.m
//  ZJCoreGraphics
//
//  Created by YunTu on 10/7/15.
//  Copyright © 2015 YunTu. All rights reserved.
//

#import "ZJContextView.h"

@implementation ZJContextView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

#define Method1
    
#ifndef Method1
    CGContextTranslateCTM(context, 0, self.height);
    CGContextScaleCTM(context, 1.0, -1.0);
#else
    CGContextRotateCTM(context, M_PI);
    CGContextScaleCTM(context, -1.0, 1.0);
    CGContextTranslateCTM(context, 0, -self.height);
#endif
    
#if 1
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    
    if (self.tag == 1) {
        CGContextTranslateCTM(context, 0, self.height/2);
    }else if (self.tag == 2) {
        CGContextScaleCTM(context, 1, 0.5);
    }else if(self.tag > 2){
        CGContextScaleCTM(context, 1, 0.5);
        CGContextTranslateCTM(context, 0, self.height/2);
        if (self.tag == 4) {
            CGContextRotateCTM(context, -M_PI/8);
        }
    }
    NSLog(@"%@", NSStringFromCGPoint(self.layer.anchorPoint));
    CGContextDrawImage(context, self.bounds, img.CGImage);
#endif
}

@end
