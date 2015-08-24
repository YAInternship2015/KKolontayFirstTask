//
//  TableViewController.h
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKRepository.h"

@interface PSTableViewController : UITableViewController 

@property (nonatomic, strong) PSKRepository *repository;

@end
