//
//  MainViewController.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "MainViewController.h"
#import <Photos/Photos.h>

@interface MainViewController ()
@property (nonatomic, strong) NSMutableOrderedSet *fetchResult;
@end

@implementation MainViewController

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.topItem.title = @"Info";
    
    tableView = [UITableView new];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    tableView.delegate = self;
    tableView.dataSource = self;

    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"HistoryCell"];
    [self.view addSubview:tableView];
    
    
    if (@available(iOS 11.0, *)) {
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        [tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [tableView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor].active = YES;
        [tableView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor].active = YES;
        [tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    } else {
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        [tableView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor].active = YES;
        [tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
        [tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
        [tableView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.bottomAnchor].active = YES;
    }
    
    [self fetchPhotoAssets];
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchResult.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";

    CustomCell* cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    PHAsset* asset = [self.fetchResult objectAtIndex:indexPath.item];
    
    PHImageManager* manager = [PHImageManager defaultManager];
    
    PHImageRequestOptions* requsetOptions = [PHImageRequestOptions new];
    [requsetOptions setSynchronous:NO];
    [requsetOptions setVersion:PHImageRequestOptionsVersionCurrent];
    [requsetOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeFastFormat]; //поставил так, чтобы 2800 фоток нормально прогружались на моем телефоне
    [requsetOptions setResizeMode:PHImageRequestOptionsResizeModeNone];
    
    
    //Тут говно-код, но я просто проверял функционал
    if (asset.mediaType == 0) {
    NSString* file_name=[asset valueForKey:@"filename"];
        cell.title_label.text = file_name;
    [cell.description_image_view setImage:[UIImage imageNamed:@"unknown_big"]];
    }
    
    if (asset.mediaType == 1) {
    [manager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:requsetOptions resultHandler:^(UIImage* result, NSDictionary* info) {
        NSString* str = [[NSString alloc ] initWithFormat:@"%dx%d", (int)asset.pixelWidth, (int)asset.pixelHeight];
        NSString* file_name=[asset valueForKey:@"filename"];
        cell.title_label.text = file_name;
        cell.description_label.text = str;
        [cell.main_image_view setImage:result];
        [cell.description_image_view setImage:[UIImage imageNamed:@"image"]];
    }];
    }
    
    if (asset.mediaType == 2) {
    [manager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:requsetOptions resultHandler:^(UIImage* result, NSDictionary* info) {
        NSTimeInterval interval = asset.duration;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (asset.duration > 3600) {
             [dateFormatter setDateFormat:@"HH:mm:ss"];
        } else {
             [dateFormatter setDateFormat:@"mm:ss"];
        }
        
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
        NSString *formattedDate = [dateFormatter stringFromDate:date];
        
        NSString* str = [[NSString alloc ] initWithFormat:@"%dx%d %@", (int)asset.pixelWidth, (int)asset.pixelHeight, formattedDate];
        NSString* file_name=[asset valueForKey:@"filename"];
        cell.title_label.text = file_name;
        cell.description_label.text = str;
        [cell.main_image_view setImage:result];
        [cell.description_image_view setImage:[UIImage imageNamed:@"video"]];
    }];
    }
    
    if (asset.mediaType == 3) {
    NSTimeInterval interval = asset.duration;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (asset.duration > 3600) {
         [dateFormatter setDateFormat:@"HH:mm:ss"];
    } else {
         [dateFormatter setDateFormat:@"mm:ss"];
    }
    
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *str = [dateFormatter stringFromDate:date];
    NSString* file_name=[asset valueForKey:@"filename"];
    cell.title_label.text = file_name;
    cell.description_label.text = str;
    [cell.description_image_view setImage:[UIImage imageNamed:@"audio_big"]];
    }
    
    UIView *bgColorView = [UIView new];
    bgColorView.backgroundColor = [UIColor colorWithRed:0.99 green:0.96 blue:0.89 alpha:1.0];
    [cell setSelectedBackgroundView:bgColorView];
    return cell;
}


- (void)fetchPhotoAssets {
    PHFetchOptions* options = [PHFetchOptions new];
    options.sortDescriptors = @[[[NSSortDescriptor alloc]initWithKey:@"creationDate" ascending:YES]];
    self.fetchResult = [PHAsset fetchAssetsWithOptions:options];
   // NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO];
   // [self.fetchResult sortUsingDescriptors:@[sortDescriptor]];
}




- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       PHAsset* asset = [self.fetchResult objectAtIndex:indexPath.item];
       PHImageManager* manager = [PHImageManager defaultManager];
       PHImageRequestOptions* requsetOptions = [PHImageRequestOptions new];
       [requsetOptions setSynchronous:NO];
       [requsetOptions setVersion:PHImageRequestOptionsVersionCurrent];
       [requsetOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeHighQualityFormat]; //поставил так, чтобы 2800 фоток нормально прогружались на моем телефоне
       [requsetOptions setResizeMode:PHImageRequestOptionsResizeModeNone];
    
       [manager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:requsetOptions resultHandler:^(UIImage* result, NSDictionary* info) {
           NSDate* creation_date = [asset creationDate];
           NSDate* last_modification_date = [asset modificationDate];
           
           NSDateFormatter* df = [[NSDateFormatter alloc]init];
           [df setDateFormat:@"HH:mm:ss dd-MM-yyyy"];
           
           NSString* creation_date_str = [df stringFromDate:creation_date];
           NSString* last_modification_date_str = [df stringFromDate:last_modification_date];
           NSString* media_type_str;
           switch (asset.mediaType) {
               case 1:
                   media_type_str = @"Image";
                   break;
               case 2:
                   media_type_str = @"Video";
                   break;
               case 3:
                   media_type_str = @"Audio";
                   break;
               default:
                   media_type_str = @"Unknown";
                   break;
           }
           
           ShareViewController* vc = [[ShareViewController alloc] initWithParameters:creation_date_str :last_modification_date_str :media_type_str :result :[asset valueForKey:@"filename"]];
           [self.navigationController pushViewController:vc animated:YES];
       }];
}

@end
