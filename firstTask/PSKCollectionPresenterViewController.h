//
//  PSKCollectionPresenterViewController.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKRepository.h"

@interface PSKCollectionPresenterViewController : UICollectionViewController

@property (nonatomic, strong) PSKRepository *repository;

@end
