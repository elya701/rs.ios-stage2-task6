//
//  MainScreenSquareView.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "MainScreenSquareView.h"

@implementation MainScreenSquareView

- (void)drawRect:(CGRect)rect {
    CGRect square = CGRectMake(0, 0, 70, 70);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.16, 0.76, 0.82, 1.0);
    CGContextSetRGBStrokeColor(context, 0.16, 0.76, 0.82, 1.0);
    CGContextFillRect(context, square);
}

@end
