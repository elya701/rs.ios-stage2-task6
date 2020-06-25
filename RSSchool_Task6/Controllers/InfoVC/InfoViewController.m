//
//  InfoViewController.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@end

@implementation InfoViewController
// Можно было использовать @synthesize

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc = [ViewController new];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.topItem.title = @"RSSchool Task 6";
    self.logo_image_view = [self createLogoImageView];
    self.square_view = [self createSquareView];
    self.circle_view = [self createCircleView];
    self.triangle_view = [self createTriangleView];
    self.name_label = [self createNameLabel];
    self.model_label = [self createModelLabel];
    self.system_label = [self createSystemLabel];
    self.high_line = [self createHighLineSeparatorView];
    self.down_line = [self createDownLineSeparatorView];
    self.cv_button = [self createCvButton];
    self.start_button = [self createStartButton];
    [self deviceName];
}

- (void)viewDidAppear:(BOOL)animated {
    [self changeButtonsAnchors]; //Я тут добавил, чтобы при изначальной загрузке в какой-либо ориентации он сразу понимал как выставлять.
    [self.vc addAnimationToCircleView:self.circle_view];
    [self.vc addAnimationToSquareView:self.square_view];
    [self.vc addAnimationToTriangleView:self.triangle_view];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [self changeButtonsAnchors]; //Меняем якоря кнопок по повороту
}

//MARK: Creating High Line Separator
- (UIView* )createHighLineSeparatorView {
    UIView* our_view = [UIView new];
    our_view.backgroundColor = UIColor.grayColor;
    [self.view addSubview:our_view];
    [self addConstraintstoHighLineSeparator:our_view];
    return our_view;
}

//MARK: Creating Down Line Separator
- (UIView* )createDownLineSeparatorView {
    UIView* our_view = [UIView new];
    our_view.backgroundColor = UIColor.grayColor;
    [self.view addSubview:our_view];
    [self addConstraintstoDownLineSeparator:our_view];
    return our_view;
}

//MARK: Creating Logo Image View
- (UIImageView* )createLogoImageView {
    UIImage* our_logo_image = [UIImage imageNamed:@"apple_logo"];
    UIImageView* our_image_view = [[UIImageView alloc] initWithImage:our_logo_image];
    [self.view addSubview:our_image_view];
    [self addConstraintsToLogoImageView:our_image_view];
    return our_image_view;
}

//MARK: Creating Name Label
- (UILabel* )createNameLabel {
    UILabel* our_label = [UILabel new];
    [self.view addSubview:our_label];
    [self addConstraintsToNameLabel:our_label];
    return our_label;
}

//MARK: Creating Model Label
- (UILabel* )createModelLabel {
    UILabel* our_label = [UILabel new];
    [self.view addSubview:our_label];
    [self addConstraintsToModelLabel:our_label];
    return our_label;
}

//MARK: Creating System Label
- (UILabel* )createSystemLabel {
    UILabel* our_label = [UILabel new];
    [self.view addSubview:our_label];
    [self addConstraintsToSystemLabel:our_label];
    return our_label;
}

//MARK: Creating CV Button
- (UIButton* )createCvButton {
    UIImage* yellow_highlighted = [self.vc imageFromColor:[UIColor colorWithRed:0.99 green:0.96 blue:0.89 alpha:1.0]];
    UIButton* our_button = [UIButton new];
    our_button.layer.masksToBounds = true;
    our_button.layer.cornerRadius = 22;
    [our_button setBackgroundColor:[UIColor colorWithRed:0.98 green:0.80 blue:0.47 alpha:1.0]];
    [our_button setBackgroundImage:yellow_highlighted forState:UIControlStateHighlighted]; //(bad decision, but idk how to do else)
    [our_button setTitle:@"Open Git CV" forState:UIControlStateNormal];
    [our_button setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
    [our_button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [our_button setTitleColor:UIColor.lightGrayColor forState:UIControlStateHighlighted];
    [our_button addTarget:self action:@selector(openCv:) forControlEvents:UIControlEventTouchUpInside];
    [self addConstraintsToCvButton:our_button];
    return our_button;
}

//MARK: Creating Start Button
- (UIButton* )createStartButton {
    UIButton* our_button = [UIButton new];
    our_button.layer.masksToBounds = true;
    our_button.layer.cornerRadius = 22;
    [our_button setBackgroundColor:[UIColor colorWithRed:0.93 green:0.41 blue:0.42 alpha:1.0]];
    //[start_button setBackgroundImage:_yellow_highlighted forState:UIControlStateHighlighted]; //(bad decision, but idk how to do else)
    [our_button setTitle:@"Go to start!" forState:UIControlStateNormal];
    [our_button setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
    [our_button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    //[start_button setTitleColor:UIColor.redColor forState:UIControlStateHighlighted];
    [our_button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self addConstraintsToStartButton:our_button];
    return our_button;
}

//MARK: Creating Circle View
- (MainScreenCircleView* )createCircleView {
    MainScreenCircleView* view = [self.vc createCircleView];
    [self.view addSubview:view];
     [self addConstraintsToCircleView: view];
    return view;
}

//MARK: Creating Square View
- (MainScreenSquareView* )createSquareView {
    MainScreenSquareView* view = [self.vc createSquareView];
    [self.view addSubview:view];
    [self addConstraintsToSquareView: view];
    return view;
}

//MARK: Creating Triangle View
- (MainScreenTriangleView* )createTriangleView {
    MainScreenTriangleView* view = [self.vc createTriangleView];
    [self.view addSubview:view];
     [self addConstraintsToTriangleView: view];
    return view;
}

//MARK: Add Constrains To High Line Separator
- (void)addConstraintstoHighLineSeparator:(UIView* )our_view {
    our_view.translatesAutoresizingMaskIntoConstraints = false;
    [our_view.heightAnchor constraintEqualToConstant:2].active = true;
    [our_view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-40].active = true;
    [our_view.topAnchor constraintEqualToAnchor:self.square_view.topAnchor constant: -20].active = true;
    [our_view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:40].active = true;
}

//MARK: Add Constrains To Down Line Separator
- (void)addConstraintstoDownLineSeparator:(UIView* )our_view {
    our_view.translatesAutoresizingMaskIntoConstraints = false;
    [our_view.heightAnchor constraintEqualToConstant:2].active = true;
    [our_view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-40].active = true;
    [our_view.bottomAnchor constraintEqualToAnchor:self.square_view.bottomAnchor constant: 20].active = true;
    [our_view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:40].active = true;
}

//MARK: Add Constrains To Name Label
- (void)addConstraintsToNameLabel:(UILabel* )our_label {
    our_label.translatesAutoresizingMaskIntoConstraints = false;
    [our_label.heightAnchor constraintEqualToConstant:20].active = true;
    [our_label.widthAnchor constraintEqualToConstant:170].active = true;
    [our_label.topAnchor constraintEqualToAnchor:self.logo_image_view.topAnchor constant:7].active = true;
    [our_label.leftAnchor constraintEqualToAnchor:self.logo_image_view.rightAnchor constant:40].active = true;
}

//MARK: Add Constrains To Model Label
- (void)addConstraintsToModelLabel:(UILabel* )our_label {
    our_label.translatesAutoresizingMaskIntoConstraints = false;
     [our_label.heightAnchor constraintEqualToConstant:20].active = true;
       [our_label.widthAnchor constraintEqualToConstant:170].active = true;
       [our_label.centerYAnchor constraintEqualToAnchor:self.logo_image_view.centerYAnchor].active = true;
       [our_label.leftAnchor constraintEqualToAnchor:self.logo_image_view.rightAnchor constant:40].active = true;
}

//MARK: Add Constrains To System Label
- (void)addConstraintsToSystemLabel:(UILabel* )our_label {
     our_label.translatesAutoresizingMaskIntoConstraints = false;
    [our_label.heightAnchor constraintEqualToConstant:20].active = true;
        [our_label.widthAnchor constraintEqualToConstant:170].active = true;
        [our_label.bottomAnchor constraintEqualToAnchor:self.logo_image_view.bottomAnchor constant:-7].active = true;
        [our_label.leftAnchor constraintEqualToAnchor:self.logo_image_view.rightAnchor constant:40].active = true;
}

//MARK: Add Constrains To Logo Image View
- (void)addConstraintsToLogoImageView:(UIImageView* )our_image_view {
    our_image_view.translatesAutoresizingMaskIntoConstraints = false;
    if (@available(iOS 11.0, *)) {
        [our_image_view.heightAnchor constraintEqualToConstant:90].active = true;
        [our_image_view.widthAnchor constraintEqualToConstant:75].active = true;
        [our_image_view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:30.0].active = true;
        [our_image_view.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:70.0].active = true;
    } else {
        [our_image_view.heightAnchor constraintEqualToConstant:90].active = true;
        [our_image_view.widthAnchor constraintEqualToConstant:75].active = true;
        [our_image_view.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:30.0].active = true;
        [our_image_view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:70.0].active = true;
    }
}

//MARK: Add Method To Recalculate Anchors After Orientation Was Changed
- (void)changeButtonsAnchors {
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        self.left_cv_button_constraint.active = false;
        self.top_cv_button_constraint.active = false;
        if (@available(iOS 11.0, *)) {
            self.top_cv_button_constraint = [self.cv_button.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20];
            self.left_cv_button_constraint = [self.cv_button.leftAnchor constraintEqualToAnchor:self.name_label.rightAnchor constant:20.0];
        } else {
            self.top_cv_button_constraint = [self.cv_button.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:20];
            self.left_cv_button_constraint = [self.cv_button.leftAnchor constraintEqualToAnchor:self.name_label.rightAnchor constant:20.0];
        }
        self.left_cv_button_constraint.active = true;
        self.top_cv_button_constraint.active = true;
    } else {
        self.left_cv_button_constraint.active = false;
        self.top_cv_button_constraint.active = false;
        self.top_cv_button_constraint = [self.cv_button.topAnchor constraintEqualToAnchor:self.down_line.bottomAnchor constant:20];
        self.left_cv_button_constraint = [self.cv_button.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:55.0];
        self.left_cv_button_constraint.active = true;
        self.top_cv_button_constraint.active = true;
    }
}

//MARK: Add Constrains To CV Button
- (void)addConstraintsToCvButton:(UIButton* )our_button {
    [self.view addSubview:our_button];
    our_button.translatesAutoresizingMaskIntoConstraints = false;
    [our_button.heightAnchor constraintEqualToConstant:44].active = true;
    self.top_cv_button_constraint = [our_button.topAnchor constraintEqualToAnchor:self.down_line.bottomAnchor constant:20];
    self.left_cv_button_constraint = [our_button.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:55.0];
    [our_button.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-55.0].active = true;
    self.top_cv_button_constraint.active = true;
    self.left_cv_button_constraint.active = true;
}

//MARK: Add Constrains To Start Button
- (void)addConstraintsToStartButton:(UIButton* )our_button {
    [self.view addSubview:our_button];
    our_button.translatesAutoresizingMaskIntoConstraints = false;
    [our_button.heightAnchor constraintEqualToConstant:44].active = true;
    [our_button.topAnchor constraintEqualToAnchor:self.cv_button.bottomAnchor constant:15].active = true;
    [our_button.leftAnchor constraintEqualToAnchor:self.cv_button.leftAnchor].active = true;
    [our_button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-55.0].active = true;
}

//MARK: Add Constrains To Circle View
- (void)addConstraintsToCircleView:(MainScreenCircleView* )our_layer {
    our_layer.translatesAutoresizingMaskIntoConstraints = false;
    [our_layer.heightAnchor constraintEqualToConstant:55].active = true;
    [our_layer.widthAnchor constraintEqualToConstant:55].active = true;
    [our_layer.topAnchor constraintEqualToAnchor:self.logo_image_view.bottomAnchor constant:35].active = true;
    [our_layer.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:45.0].active = true;
}

//MARK: Add Constrains To Triangle View
- (void)addConstraintsToTriangleView:(MainScreenTriangleView* )our_layer {
    our_layer.translatesAutoresizingMaskIntoConstraints = false;
    [our_layer.heightAnchor constraintEqualToConstant:55].active = true;
    [our_layer.widthAnchor constraintEqualToConstant:55].active = true;
    [our_layer.topAnchor constraintEqualToAnchor:self.logo_image_view.bottomAnchor constant:35].active = true;
    [our_layer.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-45.0].active = true;
}

//MARK: Add Constrains To Square View
- (void)addConstraintsToSquareView:(MainScreenSquareView* )our_layer {
    our_layer.translatesAutoresizingMaskIntoConstraints = false;
    [our_layer.heightAnchor constraintEqualToConstant:55].active = true;
    [our_layer.widthAnchor constraintEqualToConstant:55].active = true;
    [our_layer.topAnchor constraintEqualToAnchor:self.logo_image_view.bottomAnchor constant:35].active = true;
    [our_layer.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
}

//MARK: Main Button Action Method
- (void)aMethod:(UIButton*)button
{
    [self.view.window.rootViewController dismissViewControllerAnimated:true completion:nil];
}

//MARK: CV Button Action Method
- (void)openCv:(UIButton*)button
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/elya701/chatApp"]];
}

//MARK: Fetch Info About Device
- (void) deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* code = [NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding];
    
    NSString* deviceName;
    
    if ([code rangeOfString:@"iPod"].location != NSNotFound) {
        deviceName = @"iPod Touch";
    }
    else if([code rangeOfString:@"iPad"].location != NSNotFound) {
        deviceName = @"iPad";
    }
    else if([code rangeOfString:@"iPhone"].location != NSNotFound){
        deviceName = @"iPhone";
    }
    else {
        deviceName = @"Unknown";
    }
    NSString* ios_tmp = [[UIDevice currentDevice] systemVersion];
    
    NSMutableString* ios_version = [NSMutableString new];
    [ios_version appendString:@"iOS "];
    [ios_version appendString:ios_tmp];
    [self.name_label setText:code];
    [self.system_label setText:ios_version];
    [self.model_label setText:deviceName];
}

@end
