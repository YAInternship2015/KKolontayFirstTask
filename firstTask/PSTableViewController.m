//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"
#import "PSKRepository.h"
#import "PSKCustomCell.h"
#import "MagicalRecord/MagicalRecord.h"
#import "ItemsOfPicture.h"

@interface PSTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation PSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*if (!_repository) {
        _repository = [[PSKRepository alloc]init];
    }*/
    self.fetchedResultsController = [ItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id sectionInfo = [[self.fetchedResultsController sections]objectAtIndex:section];
    return[sectionInfo numberOfObjects];
}

#pragma mark - Cell review

- (PSKCustomCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [cell setupWithItem:[_repository itemAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - renew talbe 

-(void)dataWasChanged {
    [self.tableView reloadData];
}

@end
