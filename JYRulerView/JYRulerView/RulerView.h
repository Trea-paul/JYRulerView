//
//  RulerView.h
//  JYRulerView
//
//  Created by TreaPaul on 2017/6/23.
//  Copyright © 2017年 Trea-Paul. All rights reserved.
//

#define kDistanceMargin 8.0f    // 每隔间距
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import <UIKit/UIKit.h>

@class RulerDrawScrollView;
@protocol RulerViewDelegate <NSObject>

- (void)rulerView:(CGFloat)rulerViewValue;

@end

@interface RulerView : UIView

@property (nonatomic, weak) id<RulerViewDelegate>rulerDeletate;


/**
 初始化刻度尺
 
 @param maxValue 最大值
 @param minValue 最小值
 @param average 平均值
 @param currentValue 当前值
 */
- (void)rulerViewWithMaxValue:(CGFloat)maxValue
                     minValue:(CGFloat)minValue
                      average:(CGFloat)average
                 currentValue:(CGFloat)currentValue;


@end
