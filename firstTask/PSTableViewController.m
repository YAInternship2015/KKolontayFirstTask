//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"
#import "PSKCustomCell.h"
#import "PSKItemsOfPicture.h"
#import <CoreData/CoreData.h>


@interface PSTableViewController ()  <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) PSKRepository *repository;

@end

@implementation PSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   _fetchedResultsController = _repository.getFetchedResultsController;
    [_fetchedResultsController setDelegate:self];
}

#pragma mark - set repository 

- (void)setRepository:(PSKRepository *)repository {
    _repository = repository;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return[[_repository getItems]count];
}

#pragma mark - Cell review

- (PSKCustomCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSKItemsOfPicture *item = [[_repository getItems] objectAtIndex:indexPath.row];
    PSKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [cell setupWithItem:item];
    return cell;
}

#pragma mark - renew talbe 

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

#pragma  mark - delete row with animation 

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [_repository deleteItem:indexPath];
        [self.tableView endUpdates];
    }
}

@end
