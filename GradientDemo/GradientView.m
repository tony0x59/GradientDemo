//
//  GradientView.m
//  GradientDemo
//
//  Created by Tony Kong on 13-5-26.
//  Copyright (c) 2013年 Tony Kong. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();   //获得当前对象的上下文
    CGRect bounds = CGContextGetClipBoundingBox(context);   //获得绘制区域
    
    //渐变色配置
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,  //起始位置颜色
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,    //结束位置颜色
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    
    //配置起始点和结束点位置
    CGPoint start = CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.00);  //起始位置
    CGPoint end = CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 1.00);    //结束位置
    NSLog(@"start:%@ end:%@", NSStringFromCGPoint(start), NSStringFromCGPoint(end));
    
    //可选参数配置
    CGGradientDrawingOptions options = 0;
//	options |= kCGGradientDrawsBeforeStartLocation;
//	options |= kCGGradientDrawsAfterEndLocation;
    
    //开始绘制！
    CGContextDrawLinearGradient(context, gradient, start, end, options);
    
    CGGradientRelease(gradient);
}

@end
