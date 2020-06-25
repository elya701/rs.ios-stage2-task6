//
//  GalleryViewController.h
//  RSSchool_Task6
//
//  Created by Roman on 6/19/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalleryViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PHPhotoLibraryChangeObserver>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

NS_ASSUME_NONNULL_END
