//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"

@interface PSTableViewController ()

@property(nonatomic, strong) PSKRepository *repository;

@end

@implementation PSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _repository = [[PSKRepository alloc]init];
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView
                        numberOfRowsInSection:(NSInteger)section {
    return [_repository countOfItems ];
}

#pragma mark - Cell review
- (PSKCustomCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [cell initWithItem:[_repository itemAtIndex:indexPath.row]];
    return cell;
}

@end
