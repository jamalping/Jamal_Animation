//
//  FirstViewController.m
//  Jamal_Animation
//
//  Created by jamalping on 15/11/16.
//  Copyright © 2015年 cisc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

////--------------------------------使动画中的view响应事件--------------------------------
@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"First";
    // 设置view不响应事件
    _animationView.userInteractionEnabled = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:10 animations:^{
        _animationView.frame = CGRectMake(300, 300, 100, 100);
    } completion:nil];
}

- (IBAction)btnClick:(id)sender {
    // 获取动画的View的实时中心点,然后根据中心点判断点击是否在移动的View中
    NSLog(@"%@",NSStringFromCGPoint([[_animationView.layer presentationLayer] position]));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CGPoint center = [[_animationView.layer presentationLayer] position];
    if (CGRectContainsPoint(CGRectMake(center.x-50, center.y-50, 100, 100), point)) {
        NSLog(@"%@--",NSStringFromCGPoint(center));
        // to do...
//        _animationView.hidden = YES;
//        [_animationView removeFromSuperview];
    }
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
