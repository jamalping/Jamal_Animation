//
//  ViewController.m
//  Jamal_Animation
//
//  Created by jamalping on 15/11/16.
//  Copyright © 2015年 cisc. All rights reserved.
//

#import "ViewController.h"

@interface TableViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource; /**< 数据源 */


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataSource = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
    }
    [self.dataSource addObject:@"1.使动画中的View响应事件"];
    [self.dataSource addObject:@"2.按指定路径动画、以及改变事件的传递"];
}

#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        [self performSegueWithIdentifier:@"first" sender:nil];
    }else if (indexPath.row==1) {
        [self performSegueWithIdentifier:@"second" sender:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
