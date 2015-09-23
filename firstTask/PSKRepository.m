//
//  PSKRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/15/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"
#import "MagicalRecord/MagicalRecord.h"
#import "PSKItemsOfPicture.h"


@interface PSKRepository () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation PSKRepository

#pragma mark - get item of repository

- (id)init {
    self = [super init];
    if (self) {
        self.fetchedResultsController = [PSKItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
        self.items = [[NSMutableArray alloc] initWithArray:[PSKItemsOfPicture MR_findAll]];
        for (int i=0; i < _items.count; i++) {
            PSKItemsOfPicture *temp = [_items objectAtIndex:i];
            if (temp.pathPicture != nil) {
                [temp setPictureFromAsset];
            }
        }
    }
    return self;
}

#pragma mark - get items from repository

- (NSMutableArray *)getItems {
    return _items;
}

#pragma mark - delete item from repository

- (void)deleteItem:(NSIndexPath *)index {
    [_items removeObjectAtIndex:[index row]];
    PSKItemsOfPicture *item = [_fetchedResultsController objectAtIndexPath:index];
    [item MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
}

#pragma mark - add object

- (void)addItem:(NSString *)name pathPicture:(NSString *)path {
    PSKItemsOfPicture * item = [PSKItemsOfPicture MR_createEntity];
    item.pathPicture = path;
    item.namePicture = name;
    [item setPictureFromAsset];
    [_items addObject:item];
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
}

#pragma mark - get fetchedResultsController

- (NSFetchedResultsController *)getFetchedResultsController {
    return _fetchedResultsController;
}

@end
