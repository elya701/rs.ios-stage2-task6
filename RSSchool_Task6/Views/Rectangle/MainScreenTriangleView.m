//
//  MainScreenRectangleView.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "MainScreenTriangleView.h"

@implementation MainScreenTriangleView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextBeginPath(ctx);
    CGContextMoveToPoint   (ctx, CGRectGetMidX(rect), CGRectGetMinY(rect));  // top left
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));  // mid right
    CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
    CGContextClosePath(ctx);

    CGContextSetRGBFillColor(ctx, 0.20, 0.76, 0.63, 1);
    CGContextFillPath(ctx);
}

@end
