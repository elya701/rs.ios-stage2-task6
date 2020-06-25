//
//  GalleryViewController.m
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "GalleryViewController.h"
#import "InfoViewController.h"
#import "CollectionViewCell.h"
#import <AVKit/AVKit.h>


@interface GalleryViewController ()
@property (nonatomic, strong) PHFetchResult* fetchResult;
@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBar.topItem.title = @"Gallery";
    [PHPhotoLibrary.sharedPhotoLibrary registerChangeObserver:self];
    [self fetchPhotoAssets];
    [self setupCollectionView];
}

-(void)setupCollectionView {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_collectionView];
    [self addAnchorsToCollectionView];
}

-(void)addAnchorsToCollectionView {
    if (@available(iOS 11.0, *)) {
        _collectionView.translatesAutoresizingMaskIntoConstraints = false;
        [_collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:2].active = YES;
        [_collectionView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:2].active = YES;
        [_collectionView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-2].active = YES;
        [_collectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    } else {
        _collectionView.translatesAutoresizingMaskIntoConstraints = false;
        [_collectionView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.topAnchor constant:2].active = YES;
        [_collectionView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:2].active = YES;
        [_collectionView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-2].active = YES;
        [_collectionView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.bottomAnchor].active = YES;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.fetchResult.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController* vc = [UIViewController new];
    
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    vc.modalPresentationStyle = UIModalPresentationPopover;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                target:self
                                                                                action:@selector(backPressed)];
    vc.navigationItem.leftBarButtonItem = backButton;
    UIImageView* image_view = [[UIImageView alloc] initWithFrame:vc.view.frame];
    image_view.contentMode = UIViewContentModeScaleAspectFit;
    
    
    PHAsset* asset = [self.fetchResult objectAtIndex:indexPath.item];
    
    PHImageManager* manager = [PHImageManager defaultManager];
    
    PHImageRequestOptions* requsetOptions = [PHImageRequestOptions new];
    [requsetOptions setSynchronous:NO];
    [requsetOptions setVersion:PHImageRequestOptionsVersionCurrent];
    [requsetOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeOpportunistic]; //поставил так, чтобы 800 фоток нормально прогружались на моем телефоне
    [requsetOptions setResizeMode:PHImageRequestOptionsResizeModeNone];
    
    if (asset.mediaType == 1) {
        [manager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:requsetOptions resultHandler:^(UIImage* result, NSDictionary* info) {
            [image_view setBackgroundColor:UIColor.whiteColor];
            [image_view setImage:result];
        }];
        
        [vc.view addSubview:image_view];
        [[self.navigationController topViewController] presentViewController:navController
                                                                    animated:YES
                                                                  completion:nil];
    } else {
        [manager requestAVAssetForVideo:asset options:nil resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
                AVPlayerItem* player_item = [[AVPlayerItem alloc] initWithAsset:asset];
                AVPlayer* player = [[AVPlayer alloc] initWithPlayerItem:player_item];
                AVPlayerViewController* player_controller = [AVPlayerViewController new];
                player_controller.player = player;
                [self presentViewController:player_controller animated:true completion:^{
                    
                }];
            });
        }];
    }
}

-(void)backPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    PHAsset* asset = [self.fetchResult objectAtIndex:indexPath.item];
    
    PHImageManager* manager = [PHImageManager defaultManager];
    PHImageRequestOptions* requsetOptions = [PHImageRequestOptions new];
    [requsetOptions setSynchronous:NO];
    [requsetOptions setVersion:PHImageRequestOptionsVersionCurrent];
    [requsetOptions setDeliveryMode:PHImageRequestOptionsDeliveryModeFastFormat]; //поставил так, чтобы 800 фоток нормально прогружались на моем телефоне
    [requsetOptions setResizeMode:PHImageRequestOptionsResizeModeNone];
    
    [manager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:requsetOptions resultHandler:^(UIImage* result, NSDictionary* info) {
        [cell.image_view setImage:result];
    }];
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    double yourWidth = (collectionView.bounds.size.width - 4)/3.0;
    double yourHeight = yourWidth;
    return CGSizeMake(yourWidth, yourHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}


- (void)photoLibraryDidChange:(nonnull PHChange *)changeInstance {
    [self fetchPhotoAssets];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    
}

- (void)fetchPhotoAssets {
    PHFetchOptions* options = [PHFetchOptions new];
    options.sortDescriptors = @[[[NSSortDescriptor alloc]initWithKey:@"creationDate" ascending:YES]];
    self.fetchResult = [PHAsset fetchAssetsWithOptions:options];
}

@end
