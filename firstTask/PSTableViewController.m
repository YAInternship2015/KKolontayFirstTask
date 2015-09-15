//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"
#import "PSKCustomCell.h"
#import "MagicalRecord/MagicalRecord.h"
#import "PSKItemsOfPicture.h"
#import "PSKItem.h"
#import <CoreData/CoreData.h>

@interface PSTableViewController ()  <NSFetchedResultsControllerDelegate>
@end
#warning для этого контроллера справедливы все те же замечания, что и для PSKCollectionPresenterViewController
@interface PSTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fetchedResultsController = [PSKItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
    self.items = [[NSMutableArray alloc] initWithArray:[PSKItemsOfPicture MR_findAll]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return[_items count];
}

#pragma mark - Cell review

- (PSKCustomCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSKItemsOfPicture *item = [self.items objectAtIndex:indexPath.row];
    PSKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    PSKItem *memeberCell = [[PSKItem alloc]initWithNameAndPicture:item.namePicture picture:item.pathPicture];
    [cell setupWithItem:memeberCell];
    return cell;
}

#pragma mark - renew talbe 

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
    [self viewDidLoad];
}

#pragma  mark - delete row with animation 

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        PSKItemsOfPicture *item = [_fetchedResultsController objectAtIndexPath:indexPath];
        [item MR_deleteEntity];
        [_items removeObjectAtIndex:indexPath.row];
        [self.tableView endUpdates];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

@end
