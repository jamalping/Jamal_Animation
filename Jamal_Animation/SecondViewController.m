//
//  SecondViewController.m
//  Jamal_Animation
//
//  Created by jamalping on 15/11/16.
//  Copyright © 2015年 cisc. All rights reserved.
//

#import "SecondViewController.h"
#import "panelView.h"

@interface SecondViewController ()
{
    CAShapeLayer *shapeLayer;
    UIBezierPath *pacmanOpenPath;
    UIBezierPath *pacmanClosedPath;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"second";
    
    [self _initSubLayer];
    
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_initSubLayer {
    
    CGFloat radius = 30.0f;
    CGFloat diameter = radius * 2;
    CGPoint arcCenter = CGPointMake(radius, radius);
    // Create a UIBezierPath for Pacman's open state
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                                                    radius:radius
                                                startAngle:0
                                                  endAngle:2*M_PI
                                                 clockwise:YES];
    
    //    [pacmanOpenPath addLineToPoint:arcCenter];
    //    [pacmanOpenPath closePath];
    
    // Create a UIBezierPath for Pacman's close state
    pacmanClosedPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100)
                                                      radius:radius
                                                  startAngle:0
                                                    endAngle:2*M_PI
                                                   clockwise:YES];
    //    [pacmanClosedPath addLineToPoint:arcCenter];
    //    [pacmanClosedPath closePath];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = pacmanClosedPath.CGPath;
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.lineWidth = 1.0f;
    
    // 不设置bounds
    //    shapeLayer.bounds = CGRectMake(0, 0, diameter, diameter);
    shapeLayer.position = CGPointMake(0, 0);
    
    [self.view.layer addSublayer:shapeLayer];
    
    CAShapeLayer *animaLayer = [CAShapeLayer layer];
    animaLayer.position = CGPointMake(100+radius, 100);
    animaLayer.bounds = CGRectMake(0, 0, 50, 50);
    animaLayer.cornerRadius = 25;
    //    animaLayer.path = pacmanOpenPath.CGPath;
    animaLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:animaLayer];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = pacmanClosedPath.CGPath;
    moveAnimation.duration = 8.0f;
    // Setting the rotation mode ensures Pacman's mouth is always forward.  This is a very convenient CA feature.
    moveAnimation.autoreverses = YES;
    moveAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    [animaLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
    
    CABasicAnimation *tAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    tAnimation.fromValue = @0.0;
    tAnimation.toValue = @1.0;
    tAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    tAnimation.duration = 10;
    [shapeLayer addAnimation:tAnimation forKey:nil];
    //    [shapeLayer addAnimation:tAnimation forKey:@"TmoveAnimation"];
    
    UIBezierPath *bezierP = [UIBezierPath bezierPath];
    [bezierP moveToPoint:CGPointMake(20, 500)];
    [bezierP addCurveToPoint:CGPointMake(80, 300) controlPoint1:CGPointMake(140, 300) controlPoint2:CGPointMake(300, 300)];
    
    CAShapeLayer *layerB = [CAShapeLayer layer];
    layerB.path = bezierP.CGPath;
    layerB.fillColor = [UIColor clearColor].CGColor;
    layerB.strokeColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:layerB];
    
    bezierP.lineWidth = 2.0;
    CAShapeLayer *layerP = [CAShapeLayer layer];
    layerP.path = bezierP.CGPath;
    layerP.fillColor = [UIColor clearColor].CGColor;
    layerP.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layerP];
    
    CABasicAnimation *aaa = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    aaa.fromValue = @0.0;
    aaa.toValue = @1.0;
    aaa.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    aaa.duration = 5;
    [layerP addAnimation:tAnimation forKey:nil];
}


- (void)initViews
{
    panelView *panel = [[panelView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 60,
                                                                   CGRectGetWidth(self.view.frame), 60)];
    panel.backgroundColor = [UIColor redColor];
    panel.userInteractionEnabled = YES;
    [self.view addSubview:panel];
    panel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin| UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    
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
