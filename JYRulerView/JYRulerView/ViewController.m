//
//  ViewController.m
//  JYRulerView
//
//  Created by TreaPaul on 2017/6/23.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import "ViewController.h"
#import "RulerView.h"

@interface ViewController ()<RulerViewDelegate>

@property (nonatomic, strong) RulerView *rulerView;
@property (nonatomic, strong) UILabel *valueLb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *currentValue = @"100";
    
    self.valueLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 110, CGRectGetWidth(self.view.frame) - 40, 30)];
    self.valueLb.text = currentValue;
    self.valueLb.textColor = [UIColor redColor];
    self.valueLb.font = [UIFont systemFontOfSize:18];
    self.valueLb.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.valueLb];
    
    self.rulerView = [[RulerView alloc] initWithFrame:CGRectMake(20, 150, CGRectGetWidth(self.view.frame) - 40, 90)];
    
    [self.rulerView rulerViewWithMaxValue:300 minValue:10 average:1 currentValue:[currentValue floatValue]];
    self.rulerView.backgroundColor = HexRGB(0xECECEC);
    self.rulerView.layer.cornerRadius = 5.f;
    self.rulerView.rulerDeletate = self;
    [self.view addSubview:self.rulerView];
    
    
}

- (void)rulerView:(CGFloat)rulerViewValue
{
    self.valueLb.text = [NSString stringWithFormat:@"%.f",rulerViewValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
