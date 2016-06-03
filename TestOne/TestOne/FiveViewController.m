//
//  FiveViewController.m
//  TestOne
//
//  Created by 肖家莉 on 16/5/6.
//  Copyright © 2016年 肖家莉. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = self.view.frame;
    rect.origin.y = 64;
    rect.size.height = [UIScreen mainScreen].bounds.size.height - 64;
    self.view.frame = rect;

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
