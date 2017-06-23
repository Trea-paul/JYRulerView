//
//  RulerScrollView.m
//  JYRulerView
//
//  Created by TreaPaul on 2017/6/23.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import "RulerScrollView.h"
#import "RulerView.h"

@implementation RulerScrollView


- (void)drawRulerScrollView
{
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1.f;
    shapeLayer.lineCap = kCALineCapRound;
    
    int count = (self.maxValue - self.minValue) / self.rulerAverage;
    
    for (int i = self.minValue; i <= self.maxValue; i++) {
        
        UILabel *rule = [[UILabel alloc] init];
        rule.textColor = HexRGB(0xBBBBBB);
        rule.font = [UIFont systemFontOfSize:12];
        rule.text = [NSString stringWithFormat:@"%.0f", i * self.rulerAverage];
        CGSize textSize = [rule.text sizeWithAttributes:@{ NSFontAttributeName : rule.font }];
        if (i % 10 == 0) {
            // 10的倍数
            CGPathMoveToPoint(pathRef, NULL, kDistanceMargin * i , self.rulerHeight - 50);
            CGPathAddLineToPoint(pathRef, NULL, kDistanceMargin * i, self.rulerHeight);
            
            rule.frame = CGRectMake(kDistanceMargin * i - textSize.width / 2, 8, 0, 0);
            [rule sizeToFit];
            [self addSubview:rule];
        }
        else if (i % 5 == 0) {
            // 5的倍数
            CGPathMoveToPoint(pathRef, NULL, kDistanceMargin * i , self.rulerHeight);
            CGPathAddLineToPoint(pathRef, NULL, kDistanceMargin * i, self.rulerHeight - 40);
        }
        else
        {
            CGPathMoveToPoint(pathRef, NULL, kDistanceMargin * i ,  self.rulerHeight - 30);
            CGPathAddLineToPoint(pathRef, NULL, kDistanceMargin * i, self.rulerHeight);
        }
    }
    
    shapeLayer.path = pathRef;
    
    [self.layer addSublayer:shapeLayer];
    
    self.frame = CGRectMake(0, 0, self.rulerWidth, self.rulerHeight);
    
    // 开启最小模式
    //    if (self.mode) {
    UIEdgeInsets edge = UIEdgeInsetsMake(0, self.rulerWidth / 2.f - kDistanceMargin * self.minValue, 0, self.rulerWidth / 2.f + kDistanceMargin * self.minValue);
    self.contentInset = edge;
    
    self.contentOffset = CGPointMake(kDistanceMargin * (self.rulerValue / self.rulerAverage) - self.rulerWidth + (self.rulerWidth / 2.f), 0);
    //    }
    //    else
    //    {
    //        self.contentOffset = CGPointMake(DISTANCEVALUE * (self.rulerValue / [self.rulerAverage floatValue]) - self.rulerWidth / 2.f + DISTANCELEFTANDRIGHT, 0);
    //    }
    
    self.contentSize = CGSizeMake(count * kDistanceMargin, self.rulerHeight);
}


@end
