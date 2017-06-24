//
//  RulerScrollView.h
//  JYRulerView
//
//  Created by TreaPaul on 2017/6/23.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RulerScrollView : UIScrollView

@property (nonatomic, assign) CGFloat maxValue;
@property (nonatomic, assign) CGFloat minValue;

@property (nonatomic, assign) CGFloat rulerAverage;

@property (nonatomic, assign) CGFloat rulerHeight;

@property (nonatomic, assign) CGFloat rulerWidth;

@property (nonatomic, assign) CGFloat rulerValue;


/**
 绘制刻度尺
 */
- (void)drawRulerScrollView;

@end
