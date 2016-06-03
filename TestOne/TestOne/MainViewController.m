//
//  ViewController.m
//  TestOne
//
//  Created by 肖家莉 on 16/5/4.
//  Copyright © 2016年 肖家莉. All rights reserved.
//

#import "MainViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    ThreeViewController *threeVC;
    FourViewController *fourVC;
    FiveViewController *fiveVC;
    
    NSArray *titleArr;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.0 blue:0.01 alpha:1];
    
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStyleDone target:self action:@selector(rightSlideThree)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
 
    [self creatView];
}

- (void)creatView
{
    titleArr = @[@"设置",@"WIFI",@"通知"];
    
    UITableView *_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 300) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_tableView];
}


#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuserID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserID];
        
    }
    cell.textLabel.text = titleArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self skipSetView];
        
    }else if (indexPath.row == 1)
    {
        [self skipWIFIView];
        
    }else if (indexPath.row == 2)
    {
        [self skipNotification];
        
    }
}

#pragma mark -- 跳转事件
- (void)skipSetView
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)skipWIFIView
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)skipNotification
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
    [self openWithURL:url];
}

- (void)openWithURL:(NSURL *)url
{
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [[UIApplication sharedApplication] openURL:url];
    }else
    {
        NSLog(@"can not");
    }
}

- (void)rightSlideAcyion
{
    if (threeVC == nil) {
        threeVC = [[ThreeViewController alloc] init];
        [self addChildViewController:threeVC];
        [self.view addSubview:threeVC.view];
    }
    
    
    if (threeVC.isShow) {
        [threeVC viewHiddenAction];
    }else
    {
        [threeVC viewShowAction];
    }
}

- (void)rightSlideTwo
{
    if (fourVC == nil) {
        fourVC = [[FourViewController alloc] init];
        [self.tabBarController.view addSubview:fourVC.view];
    }
    
    if (fourVC.isShow) {
        [fourVC viewHiddenAction];
    }else
    {
        [fourVC viewShowAction];
    }
}

- (void)rightSlideThree
{
    if (fiveVC == nil) {
        fiveVC = [[FiveViewController alloc] init];
        [self.tabBarController.view addSubview:fiveVC.view];
    }
    
    if (fiveVC.isShow) {
        [fiveVC viewHiddenAction];
    }else
    {
        [fiveVC viewShowAction];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
