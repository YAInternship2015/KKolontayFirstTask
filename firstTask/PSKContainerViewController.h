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
#import "PSKAddItemViewController.h"

@interface PSKContainerViewController : UIViewController

- (void)swapViewControllers:(NSString *) segueIdentifier;
- (void)setRepository:(PSKRepository *)repository;

@end
