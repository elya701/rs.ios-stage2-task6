//
//  MainScreenCircleView.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "MainScreenCircleView.h"

@implementation MainScreenCircleView


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor colorWithRed:0.93 green:0.41 blue:0.42 alpha:1.0] CGColor]));
    CGContextFillPath(ctx);
}


@end
