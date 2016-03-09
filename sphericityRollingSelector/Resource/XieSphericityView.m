//
//  XieSphericityView.m
//  sphericityRollingSelector
//
//  Created by 谢鹏翔 on 16/3/4.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "XieSphericityView.h"

@interface XieSphericityView ()

@property (nonatomic, strong) NSMutableArray *dataArray;    // 数据数组

@property (nonatomic, strong) UIView *backView;             // 背景板  view

@property (nonatomic, strong) UILabel *testLabel;

@property (nonatomic, assign) CGFloat i;

@end

@implementation XieSphericityView
{
    NSTimer *_animateTimer;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        self.backView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:self.backView];
        
        
        _testLabel = [[UILabel alloc] init];
        
        _testLabel.frame = CGRectMake(frame.size.width/2-20, 0, 100, 100);
        
        _testLabel.text = @"哎呀";
        
        _testLabel.textColor = [UIColor purpleColor];
        
        _testLabel.font = [UIFont systemFontOfSize:15];
        
        _testLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.backView addSubview:_testLabel];
        
        
        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveLabels:)];
        
        swipe.direction = UISwipeGestureRecognizerDirectionRight;
        
        [self addGestureRecognizer:swipe];
        
        _i = 15;
        
        
    }
    return self;
}

- (void)moveLabels:(UISwipeGestureRecognizer *)swipe
{
    CGPoint point1 = [swipe locationInView:self];
    
    NSLog(@"%@",NSStringFromCGPoint(point1));
    
    
}

#pragma mark - 3D渲染动画，靠近
- (void)animationMoveCloseStart
{
    _animateTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animationMoveCloseGradually) userInfo:nil repeats:YES];
    [_animateTimer fire];
}

// 3D渲染动画，靠近
- (void)animationMoveCloseGradually
{
    for (UIView *view in self.backView.subviews) {
        _i = _i+ 0.1;
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)view;
            CGPoint point = view.center;
            label.center = CGPointMake(point.x, point.y +1);
            label.font = [UIFont systemFontOfSize:_i];
            
        }
        
        
    }
}


@end
