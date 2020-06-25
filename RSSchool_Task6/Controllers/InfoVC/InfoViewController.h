//
//  InfoViewController.h
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "MainScreenCircleView.h"
#import "MainScreenSquareView.h"
#import "MainScreenTriangleView.h"
#import <sys/utsname.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoViewController : UIViewController

//MARK: Outlets
@property (nonatomic, strong) ViewController* vc;
@property (nonatomic, strong) IBOutlet UIImageView* logo_image_view;
@property (nonatomic, strong) IBOutlet UILabel* name_label;
@property (nonatomic, strong) IBOutlet UILabel* model_label;
@property (nonatomic, strong) IBOutlet UILabel* system_label;
@property (nonatomic, strong) IBOutlet UIView* high_line;
@property (nonatomic, strong) IBOutlet UIView* down_line;
@property (nonatomic, strong) MainScreenCircleView* circle_view;
@property (nonatomic, strong) MainScreenSquareView* square_view;
@property (nonatomic, strong) MainScreenTriangleView* triangle_view;
@property (nonatomic, strong) IBOutlet UIButton* cv_button;
@property (nonatomic, strong) IBOutlet UIButton* start_button;
@property (nonatomic,strong)NSLayoutConstraint* left_cv_button_constraint;
@property (nonatomic,strong)NSLayoutConstraint* top_cv_button_constraint;

//MARK: Methods


@end

NS_ASSUME_NONNULL_END
