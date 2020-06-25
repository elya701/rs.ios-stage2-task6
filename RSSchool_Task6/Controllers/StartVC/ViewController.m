//
//  ViewController.m
//  RSSchool_Task6
//
//  Created by Roman on 6/18/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@end

@implementation ViewController
// Можно было использовать @synthesize

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.button = [self createButton];
    self.label = [self createLabel];
    self.square_view = [self createSquareView];
    self.circle_view = [self createCircleView];
    self.triangle_view = [self createTriangleView];
    [self addConstraintsToSquareView:self.square_view];
    [self addConstraintsToCircleView:self.circle_view];
    [self addConstraintsToTriangleView:self.triangle_view];
}

- (void)viewDidAppear:(BOOL)animated {
    [self addAnimationToSquareView:self.square_view];
    [self addAnimationToCircleView:self.circle_view];
    [self addAnimationToTriangleView:self.triangle_view];
}

//MARK: Creating Square View
- (MainScreenSquareView* ) createSquareView  {
    MainScreenSquareView* our_layer = [MainScreenSquareView new];
    our_layer.backgroundColor = UIColor.whiteColor;
    return our_layer;
}

//MARK: Creating Circle View
- (MainScreenCircleView* ) createCircleView {
    MainScreenCircleView* our_layer = [MainScreenCircleView new];
    our_layer.backgroundColor = UIColor.whiteColor;
    return our_layer;
}

//MARK: Creating Triangle View
- (MainScreenTriangleView* ) createTriangleView {
    MainScreenTriangleView* our_layer = [MainScreenTriangleView new];
    our_layer.backgroundColor = UIColor.whiteColor;
    return our_layer;
}

//MARK: Creating Main Label
- (UILabel* ) createLabel {
    // Тут по уму нужно сделать чтобы label изменял ширину/высоту по размеру текста, но я пока сделал так, коряво
    UILabel* label = [UILabel new];
    [label setText:@"Are you ready?"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightMedium]];
    [label setTextColor:UIColor.blackColor];
    [self.view addSubview:label];
    [self addConstraintsToMainLabel:label];
    return label;
}

//MARK: Creating Main Button
- (UIButton* ) createButton {
    UIImage* yellow_highlighted = [self imageFromColor:[UIColor colorWithRed:0.99 green:0.96 blue:0.89 alpha:1.0]];
    UIButton* button = [UIButton new];
    button.layer.masksToBounds = true;
    button.layer.cornerRadius = 22;
    [button setBackgroundColor:[UIColor colorWithRed:0.98 green:0.80 blue:0.47 alpha:1.0]];
    [button setBackgroundImage:yellow_highlighted forState:UIControlStateHighlighted]; //(очень плохое решение...)
    [button setTitle:@"START" forState:UIControlStateNormal];
    [button setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    //[button setTitleColor:UIColor.redColor forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self addConstraintsToMainButton:button];
    return  button;
}

//MARK: Add Constrains To Square View
- (void) addConstraintsToSquareView:(MainScreenSquareView* ) our_view {
    [self.view addSubview:our_view];
    our_view.translatesAutoresizingMaskIntoConstraints = false;
    [our_view.heightAnchor constraintEqualToConstant:55].active = true;
    [our_view.widthAnchor constraintEqualToConstant:55].active = true;
    [our_view.bottomAnchor constraintEqualToAnchor:self.button.topAnchor constant:-40].active = true;
    [our_view.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
}

//MARK: Add Constrains To Circle View
- (void) addConstraintsToCircleView:(MainScreenCircleView* ) our_view {
    [self.view addSubview:our_view];
    our_view.translatesAutoresizingMaskIntoConstraints = false;
    [our_view.heightAnchor constraintEqualToConstant:55].active = true;
    [our_view.widthAnchor constraintEqualToConstant:55].active = true;
    [our_view.bottomAnchor constraintEqualToAnchor:self.button.topAnchor constant:-40].active = true;
    [our_view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:45.0].active = true;
}

//MARK: Add Constrains To Triangle View
- (void) addConstraintsToTriangleView:(MainScreenTriangleView* ) our_view {
    [self.view addSubview:our_view];
    our_view.translatesAutoresizingMaskIntoConstraints = false;
    [our_view.heightAnchor constraintEqualToConstant:55].active = true;
    [our_view.widthAnchor constraintEqualToConstant:55].active = true;
    [our_view.bottomAnchor constraintEqualToAnchor:self.button.topAnchor constant:-40].active = true;
    [our_view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-45.0].active = true;
}

//MARK: Add Constrains To Main Label
- (void) addConstraintsToMainLabel:(UILabel* )our_label {
    our_label.translatesAutoresizingMaskIntoConstraints = false;
    [our_label.heightAnchor constraintEqualToConstant:55].active = true;
    [our_label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:45.0].active = true;
    [our_label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:70.0].active = true;
    [our_label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-70].active = true;
}

//MARK: Add Constrains To Main Button
- (void) addConstraintsToMainButton:(UIButton* )our_button {
    our_button.translatesAutoresizingMaskIntoConstraints = false;
       [our_button.heightAnchor constraintEqualToConstant:44].active = true;
       [our_button.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-70.0].active = true;
       [our_button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:55.0].active = true;
       [our_button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-55.0].active = true;
}

//MARK: Add Animation For Triangle View
- (void) addAnimationToTriangleView:(UIView* )our_view {
    CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    fullRotation.duration = 5;
    fullRotation.repeatCount = INFINITY;
    [our_view.layer addAnimation:fullRotation forKey:@"360"];
}

//MARK: Add Animation For Square View
- (void) addAnimationToSquareView:(UIView* )our_view {
    CABasicAnimation *move_animation;
    move_animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    move_animation.fromValue = [NSNumber numberWithFloat:-(our_view.frame.size.width * 0.1)];
    move_animation.toValue = [NSNumber numberWithFloat:our_view.frame.size.width * 0.1];
    move_animation.duration = 1;
    move_animation.autoreverses = YES;
    move_animation.repeatCount = INFINITY;
    move_animation.removedOnCompletion = NO;
    [our_view.layer addAnimation:move_animation forKey:@"move_animation"];
}

//MARK: Add Animation For Circle View
- (void) addAnimationToCircleView:(UIView* )our_view {
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:0.9f];
    animation.toValue = [NSNumber numberWithFloat:1.1f];
    animation.duration = 1;
    animation.autoreverses = YES;
    animation.removedOnCompletion=NO;
    animation.repeatCount = INFINITY;
    [our_view.layer addAnimation:animation forKey:@"zoom"];
}

//MARK: Main Button Action Method
- (void)aMethod:(UIButton*)button
 {
     TabBarController* tabBarController = [TabBarController new];
     [tabBarController setModalPresentationStyle: UIModalPresentationFullScreen];
     tabBarController.selectedIndex = 1;
     [self presentViewController:tabBarController animated:YES completion:nil];
}

//MARK: UIColor to UIImage method
- (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

