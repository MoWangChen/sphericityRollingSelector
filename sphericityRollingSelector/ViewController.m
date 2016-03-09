//
//  ViewController.m
//  sphericityRollingSelector
//
//  Created by 谢鹏翔 on 16/3/4.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "ViewController.h"
#import "XieSphericityView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XieSphericityView *sphericty = [[XieSphericityView alloc] initWithFrame:CGRectMake(50, 50, 300, 400)];
    
    [self.view addSubview:sphericty];
    
    [sphericty animationMoveCloseStart];
    
}

- (void)initProperty
{
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        
        NSString *str = [NSString stringWithFormat:@"文字-%d",i+1];
        
        NSDictionary *dic = @{@"text":str,
                              @"upDown":@0,
                              };
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dic];
        
        [dataArray addObject:dict];
        
    }
    
}


@end
