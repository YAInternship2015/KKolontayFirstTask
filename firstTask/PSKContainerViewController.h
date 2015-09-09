//
//  PSKContainerViewController.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTableViewController.h"
#import "PSKCollectionPresenterViewController.h"

@interface PSKContainerViewController : UIViewController

@property (nonatomic, strong) PSTableViewController *tableViewController;
@property (nonatomic, strong) PSKCollectionPresenterViewController *collectionPresenterController;
@property (nonatomic, strong) NSString *currentSegueIdentifier;
- (void)swapViewControllers:(NSString *) segueIdentifier;

@end
