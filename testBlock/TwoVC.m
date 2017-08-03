//
//  TwoVC.m
//  testBlock
//
//  Created by zfw on 2017/7/31.
//  Copyright © 2017年 Private. All rights reserved.
//

#import "TwoVC.h"
#import "ThreeVC.h"

@interface TwoVC ()

@end

@implementation TwoVC


-(void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;//(弱引用)
    [[NSNotificationCenter defaultCenter] addObserverForName:@"testBlock" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        __strong typeof(self) strongSelf = weakSelf;
        NSDictionary *userInfo = note.userInfo;
        NSLog(@"userInfo--%@ -- self.view - %p",userInfo,strongSelf.view);
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s",__func__);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ThreeVC *vc = [ThreeVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
