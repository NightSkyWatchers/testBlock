//
//  FourVC.m
//  testBlock
//
//  Created by zfw on 2017/8/3.
//  Copyright © 2017年 Private. All rights reserved.
//

#import "FourVC.h"

@interface FourVC ()

/** block */
@property (nonatomic, copy) void(^myblock)();

@end

@implementation FourVC

-(void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    _myblock = ^ {
        NSLog(@"--%p",self.view);
    };
    _myblock();
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
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
