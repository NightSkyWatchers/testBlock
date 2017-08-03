//
//  ThreeVC.m
//  testBlock
//
//  Created by zfw on 2017/7/31.
//  Copyright © 2017年 Private. All rights reserved.
//

#import "ThreeVC.h"
#import "FourVC.h"
#import <MJRefresh/MJRefresh.h>

@interface ThreeVC ()<UITableViewDataSource,UITableViewDelegate>
/** tableview */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ThreeVC

-(void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    __weak typeof(self) weakSelf = self;//(弱引用)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        __strong typeof(self) strongSelf = weakSelf;
        NSLog(@"MJrefresh --下拉刷新");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"testBlock" object:nil userInfo:@{@"Project":@"testNotificationBlock"}];
        [self endrefresh];

    }];
    [self.tableView.mj_header beginRefreshing];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"123";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FourVC *vc = [FourVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)endrefresh {
    [self.tableView.mj_header endRefreshing];
}

//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//        _tableView.dataSource = self;
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            NSLog(@"refresh --- %p",self.view);
//        }];
//    }
//    return _tableView;
//}

@end
