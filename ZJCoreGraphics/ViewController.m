//
//  ViewController.m
//  ZJCoreGraphics
//
//  Created by YunTu on 15/7/23.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ViewController.h"

#import "ZJCGAffineTransformViewController.h"

#import "ZJBezierViewController.h"
#import "ZJLoopLodingViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_sectionTitles, *_titles;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *CELLID = @"cellID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self initAry];
}

- (void)initAry {
    _sectionTitles = @[@"基础知识篇", @"Demo篇"];
    
    NSArray *s1 = @[@"CGAffineTransformMake"];
    NSArray *s2 = @[@"LoopLoading", @"BezierPath", @"Write"];
    _titles = @[s1, s2];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    cell.textLabel.text = _titles[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row;
    UIViewController *vc;
    
    if (indexPath.section == 0) {
        if (row == 0) {
            vc = [[ZJCGAffineTransformViewController alloc] init];
        }else if (row == 1) {
            vc = [[ZJCGAffineTransformViewController alloc] init];
        }
    }else if (indexPath.section == 1){
        if (row == 0) {
            vc = [[ZJLoopLodingViewController alloc] init];
        }else if (row == 1) {
            vc = [[ZJBezierViewController alloc] init];
        }else if (row == 2) {
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZJWrite"];
        }
    }
    
    if (vc) {
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
