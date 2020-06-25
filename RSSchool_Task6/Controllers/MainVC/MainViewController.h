//
//  MainViewController.h
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "ShareViewController.h"

NS_ASSUME_NONNULL_BEGIN


@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
