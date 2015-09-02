//
//  TableViewController.h
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKRepository.h"
#import "PSKAddItemViewController.h"

@interface PSTableViewController : UITableViewController <ModelsDataSourceDelegate>

@property (nonatomic, strong) PSKRepository *repository;

@end
