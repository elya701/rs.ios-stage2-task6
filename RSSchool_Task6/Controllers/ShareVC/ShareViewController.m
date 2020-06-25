//
//  ShareViewController.m
//  RSSchool_Task6
//
//  Created by Roman on 6/25/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()
@property (strong, nonatomic) UIImage* main_image;
@property (strong, nonatomic) NSString* creation_str;
@property (strong, nonatomic) NSString* modification_str;
@property (strong, nonatomic) NSString* media_type_str;
@property (strong, nonatomic) NSString* image_name;

@property (strong, nonatomic) UILabel* creation_label;
@property (strong, nonatomic) UILabel* modification_label;
@property (strong, nonatomic) UILabel* type_label;
@property (strong, nonatomic) UIButton* share_button;
@property (strong, nonatomic) UIImageView* image_view;
@property (strong, nonatomic) UIScrollView* scroll;

@property (nonatomic,strong)NSLayoutConstraint* left_constraint;
@property (nonatomic,strong)NSLayoutConstraint* top_constraint;
@property (nonatomic,strong)NSLayoutConstraint* right_constraint;
@property (nonatomic,strong)NSLayoutConstraint* height_constraint;

@property (nonatomic,strong)NSLayoutConstraint* height_constraint_with_priority;

@property (nonatomic,strong)NSLayoutConstraint* image_height_constraint;


@end

@implementation ShareViewController
@synthesize scroll;
@synthesize image_view;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   

    scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scroll.backgroundColor = UIColor.whiteColor;
    
   scroll.showsHorizontalScrollIndicator = YES;
   [self.view addSubview:scroll];
    scroll.translatesAutoresizingMaskIntoConstraints = false;
    _top_constraint = [scroll.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor];
    _left_constraint = [scroll.leftAnchor constraintEqualToAnchor:self.view.leftAnchor];
    _right_constraint = [scroll.rightAnchor constraintEqualToAnchor:self.view.rightAnchor];
    _height_constraint = [scroll.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor];
    _top_constraint.active = TRUE;
    _left_constraint.active = TRUE;
    _right_constraint.active = TRUE;
    _height_constraint.active = TRUE;
    
    UIView* content_view = [UIView new];
    
    content_view.translatesAutoresizingMaskIntoConstraints = false;
    [scroll addSubview:content_view];
    [content_view.topAnchor constraintEqualToAnchor:scroll.topAnchor].active = TRUE;
    [content_view.bottomAnchor constraintEqualToAnchor:scroll.bottomAnchor].active = TRUE;
    [content_view.leadingAnchor constraintEqualToAnchor:scroll.leadingAnchor].active = TRUE;
    [content_view.trailingAnchor constraintEqualToAnchor:scroll.trailingAnchor].active = TRUE;
    [content_view.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = TRUE;
    _height_constraint_with_priority = [content_view.heightAnchor constraintEqualToAnchor:self.view.heightAnchor];
    _height_constraint_with_priority.priority = 250;
    _height_constraint_with_priority.active = TRUE;

    
    image_view = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.width - 40)];
    image_view.contentMode = UIViewContentModeScaleAspectFit;
    image_view.translatesAutoresizingMaskIntoConstraints = false;
    image_view.clipsToBounds = TRUE;
    [content_view addSubview:image_view];
    
    
    [image_view.topAnchor constraintEqualToAnchor:content_view.topAnchor constant:10].active = true;
    [image_view.leftAnchor constraintEqualToAnchor:content_view.leftAnchor constant:10].active = true;
    [image_view.rightAnchor constraintEqualToAnchor:content_view.rightAnchor constant:-10].active = true;
    CGFloat our_ratio = _main_image.size.height / _main_image.size.width;
    _image_height_constraint = [image_view.heightAnchor constraintEqualToAnchor:image_view.widthAnchor multiplier:our_ratio];
    _image_height_constraint.active = TRUE;
    
    [image_view setImage:_main_image];
    
    _creation_label = [UILabel new];
    _modification_label = [UILabel new];
    _type_label = [UILabel new];
    _share_button = [UIButton new];
    
    _share_button.layer.masksToBounds = true;
          _share_button.layer.cornerRadius = 22;
          [_share_button setBackgroundColor:[UIColor colorWithRed:0.98 green:0.80 blue:0.47 alpha:1.0]];
          [_share_button setTitle:@"Share" forState:UIControlStateNormal];
          [_share_button setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
          [_share_button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    
    
    NSString* tmp_str_one = [[NSString alloc] initWithFormat:@"Creation date: %@",_creation_str];
    NSString* tmp_str_two = [[NSString alloc] initWithFormat:@"Modification date: %@",_modification_str];
    NSString* tmp_str_three = [[NSString alloc] initWithFormat:@"Type: %@",_media_type_str];
    
    NSMutableAttributedString *string_one = [[NSMutableAttributedString alloc] initWithString:tmp_str_one];
    [string_one addAttribute:NSForegroundColorAttributeName
    value:[UIColor grayColor]
    range:NSMakeRange(0, 13)];
    
    NSMutableAttributedString *string_two = [[NSMutableAttributedString alloc] initWithString:tmp_str_two];
    [string_two addAttribute:NSForegroundColorAttributeName
    value:[UIColor grayColor]
    range:NSMakeRange(0, 18)];
    
    NSMutableAttributedString *string_three = [[NSMutableAttributedString alloc] initWithString:tmp_str_three];
    [string_three addAttribute:NSForegroundColorAttributeName
    value:[UIColor grayColor]
    range:NSMakeRange(0, 5)];
    
    [_creation_label setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [_modification_label setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [_type_label setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    
    [_creation_label setAttributedText: string_one];
     [_modification_label setAttributedText: string_two];
     [_type_label setAttributedText: string_three];
   
    
    [content_view addSubview:_creation_label];
    [content_view addSubview:_modification_label];
    [content_view addSubview:_type_label];
    [content_view addSubview:_share_button];
    
    
    _creation_label.translatesAutoresizingMaskIntoConstraints = false;
    _modification_label.translatesAutoresizingMaskIntoConstraints = false;
    _type_label.translatesAutoresizingMaskIntoConstraints = false;
    
    [_creation_label.leftAnchor constraintEqualToAnchor:image_view.leftAnchor].active = true;
    [_creation_label.topAnchor constraintEqualToAnchor:image_view.bottomAnchor constant:2].active = true;
    [_creation_label.widthAnchor constraintEqualToConstant:330].active = true;
    [_creation_label.heightAnchor constraintEqualToConstant:30].active = true;
    
    [_modification_label.leftAnchor constraintEqualToAnchor:image_view.leftAnchor].active = true;
    [_modification_label.topAnchor constraintEqualToAnchor:_creation_label.bottomAnchor constant:2].active = true;
    [_modification_label.widthAnchor constraintEqualToConstant:330].active = true;
    [_modification_label.heightAnchor constraintEqualToConstant:30].active = true;
    
    [_type_label.leftAnchor constraintEqualToAnchor:image_view.leftAnchor].active = true;
    [_type_label.topAnchor constraintEqualToAnchor:_modification_label.bottomAnchor constant:2].active = true;
    [_type_label.widthAnchor constraintEqualToConstant:330].active = true;
    [_type_label.heightAnchor constraintEqualToConstant:30].active = true;
    
      
       //[button setTitleColor:UIColor.redColor forState:UIControlStateHighlighted];
       [_share_button addTarget:self action:@selector(aMethod) forControlEvents:UIControlEventTouchUpInside];
       
    
    _share_button.translatesAutoresizingMaskIntoConstraints = false;
    [_share_button.heightAnchor constraintEqualToConstant:44].active = true;
    [_share_button.topAnchor constraintEqualToAnchor:_type_label.bottomAnchor constant:5].active = true;
    [_share_button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:55.0].active = true;
    [_share_button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-55.0].active = true;
    [_share_button.bottomAnchor constraintEqualToAnchor:scroll.bottomAnchor].active = true;
    
    
    
    UIBarButtonItem *myBackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage
               imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self
                                                                               action:@selector(navMethod) ];
               
               self.navigationItem.leftBarButtonItem = myBackButton;
   
    
    
    
}

- (instancetype)initWithParameters:(NSString* ) creation_str :(NSString* ) modification_str :(NSString* ) media_type_str :(UIImage* ) main_image :(NSString* )image_name
{
    self = [super init];
    if (self) {
        _creation_str = creation_str;
        _modification_str = modification_str;
        _media_type_str = media_type_str;
        _main_image = main_image;
        _image_name = image_name;
    }
    return self;
}

- (void) aMethod {
    NSMutableArray *activityItems= [NSMutableArray arrayWithObjects:_main_image, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo, UIActivityTypeAirDrop];
    
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:activityViewController animated:YES completion:nil];
    }
    //if iPad
    else {
        // Change Rect to position Popover
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

- (void) navMethod {
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = _image_name;
}

@end
