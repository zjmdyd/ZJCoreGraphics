//
//  ZJWriteViewController.m
//  ZJDraw
//
//  Created by YunTu on 15/3/16.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJWriteViewController.h"
#import "ZJWriteView.h"

@interface ZJWriteViewController ()

@property (weak, nonatomic) IBOutlet ZJWriteView *myView;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegment;

@end

@implementation ZJWriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"写字板";
    [self.myView initMyView];
}

/*
 通过Slider来调节线条的宽度
 */
- (IBAction)sliderChange:(id)sender{
    self.myView.lineWidth = self.mySlider.value;
}

/*
 通过segmentControl来设置线条的颜色
 */
- (IBAction)tapSegment:(id)sender {
    
    switch (self.mySegment.selectedSegmentIndex) {
        case 0:
            self.myView.color = [UIColor redColor];
            break;
        case 1:
            self.myView.color = [UIColor blackColor];
            break;
        case 2:
            self.myView.color = [UIColor greenColor];
            break;
            
        default:
            break;
    }
}

- (IBAction)tapBack:(id)sender {
    [self.myView backImage];
}

//Redo操作
- (IBAction)tapGo:(id)sender {
    [self.myView forwardImage];
}

- (IBAction)tapClean:(id)sender {
    [self.myView cleanImage];
}

/*
 保存操作，也许下面的保存操作在处理方式上略显笨拙，如有更好的解决方案请留言。 保存的时候我是先截了个屏，然后把白板进行切割，把切割后图片存入到相册中
 */
- (IBAction)tapSave:(id)sender {
    //截屏
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *uiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //截取画图版部分
    CGImageRef sourceImageRef = [uiImage CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(36, 6, 249, 352));
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    //把截的屏保存到相册
    UIImageWriteToSavedPhotosAlbum(newImage , nil, nil, nil);
    
    //给个保存成功的反馈
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储照片成功"
                                                    message:@"您已将照片存储于图片库中，打开照片程序即可查看。"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
