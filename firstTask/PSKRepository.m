//
//  PSKRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/15/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"
#import "MagicalRecord/MagicalRecord.h"
#import "PSKItem.h"
#import "PSKItemsOfPicture.h"
#import <CoreData/CoreData.h>

@interface PSKRepository () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PSKRepository

#pragma mark - get item of repository

- (id)init {
    self = [super init];
    if (self) {
        self.fetchedResultsController = [PSKItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
        self.items = [[NSMutableArray alloc] initWithArray:[PSKItemsOfPicture MR_findAll]];
    }
    return self;
}

#pragma mark - set fetchedResultsController



#pragma mark - get items from repository

- (NSMutableArray *)getItems {
    return _items;
}

- (void)deleteItem:(NSIndexPath *)index {
    [_items removeObjectAtIndex:[index row]];
    PSKItem *item = [_fetchedResultsController objectAtIndexPath:index];
    [item MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
}

#pragma mark - add object

- (void)addItem:(NSString *)name pathPicture:(NSString *)path {
    PSKItemsOfPicture * item = [PSKItemsOfPicture MR_createEntity];
    item.pathPicture = path;
    item.namePicture = name;
    [_items addObject:item];
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
}

@end
