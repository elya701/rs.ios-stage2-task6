//
//  ViewController.h
//  RSSchool_Task6
//
//  Created by Roman on 6/18/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreenCircleView.h"
#import "MainScreenSquareView.h"
#import "MainScreenTriangleView.h"
#import "TabBarController.h"

@interface ViewController : UIViewController

//MARK: Outlets
@property (nonatomic, strong) IBOutlet UIButton* button;
@property (nonatomic, strong) IBOutlet UILabel* label;
@property (nonatomic, strong) MainScreenCircleView* circle_view;
@property (nonatomic, strong) MainScreenSquareView* square_view;
@property (nonatomic, strong) MainScreenTriangleView* triangle_view;

//MARK: Methods
- (MainScreenSquareView* ) createSquareView;
- (MainScreenCircleView* ) createCircleView;
- (MainScreenTriangleView* ) createTriangleView;
- (UILabel* ) createLabel;
- (UIButton* ) createButton;
- (void) addConstraintsToSquareView:(MainScreenSquareView* ) our_view;
- (void) addConstraintsToCircleView:(MainScreenCircleView* ) our_view;
- (void) addConstraintsToTriangleView:(MainScreenTriangleView* ) our_view;
- (void) addConstraintsToMainLabel:(UILabel* )our_label;
- (void) addConstraintsToMainButton:(UIButton* )our_button;
- (void) addAnimationToTriangleView:(UIView* )our_view;
- (void) addAnimationToSquareView:(UIView* )our_view;
- (void) addAnimationToCircleView:(UIView* )our_view;
- (void)aMethod:(UIButton*)button;
- (UIImage *)imageFromColor:(UIColor *)color;
@end

