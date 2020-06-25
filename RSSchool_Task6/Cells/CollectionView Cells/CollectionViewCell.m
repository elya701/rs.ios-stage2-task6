//
//  CollectionViewCell.m
//  RSSchool_Task6
//
//  Created by Roman on 6/24/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _image_view = [UIImageView new];
        [self.contentView addSubview:_image_view];
        _image_view.translatesAutoresizingMaskIntoConstraints = false;
        [_image_view.topAnchor constraintEqualToAnchor: self.contentView.topAnchor constant:2].active = true;
        [_image_view.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor constant:-2].active = true;
        [_image_view.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:2].active = true;
        [_image_view.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor constant:-2].active = true;
    }
    return self;
}



@end
