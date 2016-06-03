//
//  FourViewController.m
//  TestOne
//
//  Created by 肖家莉 on 16/5/6.
//  Copyright © 2016年 肖家莉. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()
{
    UIView *rightView;
}

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = self.view.frame;
    rect.origin.y = 64;
    rect.size.height = [UIScreen mainScreen].bounds.size.height - 64;
    self.view.frame = rect;
    
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.view.alpha = 0;
    _isShow = NO;

}


- (void)viewShowAction
{
    if (rightView == nil) {
        rightView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width - 80, self.view.bounds.size.height)];
        rightView.backgroundColor = [UIColor whiteColor];
    }
    [self.view addSubview:rightView];
    
    [UIView animateWithDuration:0.35 animations:^{
        
        self.view.alpha = 1;
        CGRect rect = rightView.frame;
        rect.origin.x = 80;
        rightView.frame = rect;
    }];
    _isShow = YES;
}

- (void)viewHiddenAction
{
    [UIView animateWithDuration:0.35 animations:^{
        
        self.view.alpha = 0;
        
        CGRect rect = rightView.frame;
        rect.origin.x = self.view.bounds.size.width;
        rightView.frame = rect;
    }];
    _isShow = NO;
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
