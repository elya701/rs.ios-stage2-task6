//
//  ShareViewController.h
//  RSSchool_Task6
//
//  Created by Roman on 6/25/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareViewController : UIViewController
- (instancetype)initWithParameters:(NSString* ) creation_str :(NSString* ) modification_str :(NSString* ) media_type_str :(UIImage* ) main_image :(NSString* )image_name;
@end

NS_ASSUME_NONNULL_END
