//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"

@interface PSTableViewController ()


@end

@implementation PSTableViewController

PSKRepository *repository;

- (void)viewDidLoad {
    [super viewDidLoad];
    repository = [[PSKRepository alloc]init];
   }



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView
                        numberOfRowsInSection:(NSInteger)section {
    
    return [repository countOfItems ];

}

#pragma mark - Cell review

- (PSKCustomCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PSKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [cell initWithItem:[repository valueForCustom:indexPath.row]];
    
    return cell;
}


@end
