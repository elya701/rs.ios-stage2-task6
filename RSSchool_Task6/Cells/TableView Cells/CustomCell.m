//
//  CustomCell.m
//  RSSchool_Task6
//
//  Created by Roman on 6/22/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _title_label = [UILabel new];
        [_title_label setTextColor:[UIColor blackColor]];
        [_title_label setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightSemibold]];
        _title_label.translatesAutoresizingMaskIntoConstraints = false;
        [self.contentView addSubview:_title_label];
        
        _main_image_view = [UIImageView new];
        [self.contentView addSubview:_main_image_view];
        
        _description_image_view = [UIImageView new];
        [self.contentView addSubview:_description_image_view];
        
        _description_label = [UILabel new];
        [_description_label setTextColor:[UIColor blackColor]];
        [_description_label setFont:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular]];
        [_description_label setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_description_label];
        
        _main_image_view.translatesAutoresizingMaskIntoConstraints = false;
        [_main_image_view.widthAnchor constraintEqualToConstant:70].active = true;
        [_main_image_view.heightAnchor constraintEqualToConstant:70].active = true;
        [_main_image_view.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5].active = true;
        [_main_image_view.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:5].active = true;
       
        
        
       
        
        
  
        [_title_label.widthAnchor constraintEqualToConstant:200].active = true;
        [_title_label.heightAnchor constraintEqualToConstant:15].active = true;
        [_title_label.topAnchor constraintEqualToAnchor:_main_image_view.topAnchor constant:15].active = true;
        [_title_label.leftAnchor constraintEqualToAnchor:_main_image_view.rightAnchor constant:15].active = true;
        
        
         _description_image_view.translatesAutoresizingMaskIntoConstraints = false;
  
        
        [_description_image_view.widthAnchor constraintEqualToConstant:17].active = true;
        [_description_image_view.heightAnchor constraintEqualToConstant:20].active = true;
        [_description_image_view.topAnchor constraintEqualToAnchor:_title_label.bottomAnchor constant:10].active = true;
        [_description_image_view.leftAnchor constraintEqualToAnchor:_title_label.leftAnchor].active = true;
        
        
        [_description_label.widthAnchor constraintEqualToConstant:200].active = true;
        [_description_label.heightAnchor constraintEqualToConstant:10].active = true;
        [_description_label.centerYAnchor constraintEqualToAnchor:_description_image_view.centerYAnchor].active = true;
        [_description_label.leftAnchor constraintEqualToAnchor:_description_image_view.rightAnchor constant:5].active = true;
        
    }
    
    return self;
}

- (void)layoutSubViews
{
    [super layoutSubviews];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
