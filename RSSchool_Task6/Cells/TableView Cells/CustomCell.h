//
//  CustomCell.h
//  RSSchool_Task6
//
//  Created by Roman on 6/22/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property (nonatomic, strong) UIImageView* main_image_view;
@property (nonatomic, strong) UILabel* title_label;
@property (nonatomic, strong) UILabel* description_label;
@property (nonatomic, strong) UIImageView* description_image_view;
@end

NS_ASSUME_NONNULL_END
