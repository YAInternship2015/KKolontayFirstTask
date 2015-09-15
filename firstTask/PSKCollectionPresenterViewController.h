//
//  PSKCollectionPresenterViewController.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#warning следующие два импорта не нужны в *.h файле
#import "PSKAddItemViewController.h"
#import <CoreData/CoreData.h>

#warning <NSFetchedResultsControllerDelegate, UIGestureRecognizerDelegate> также можно перенести в *.m
@interface PSKCollectionPresenterViewController : UICollectionViewController <NSFetchedResultsControllerDelegate,
    UIGestureRecognizerDelegate
    >

@end
