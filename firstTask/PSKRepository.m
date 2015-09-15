//
//  PSKRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/15/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"
#import "MagicalRecord/MagicalRecord.h"
#import <CoreData/CoreData.h>
#import "PSKItem.h"

@interface PSKRepository () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PSKRepository

#pragma mark - get item of repository

- (id)init {
    self = [super init];
    if (self) {
        self.fetchedResultsController = [PSKItem MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
        self.items = [[NSMutableArray alloc] initWithArray:[PSKItem MR_findAll]];
    }
    return self;
}

# pragma mark - get items from repository

- (NSMutableArray *)getItems {
    return _items;
}

- (void) deleteContent:(NSIndexPath *)index sended:(NSObject *)sender{
    [_items removeObjectAtIndex:[index row]];
    if (_items.count > 0) {
        if ([sender isKindOfClass:[UICollectionViewController class]] ) {
            UICollectionViewController * temp = (UICollectionViewController *)sender;
        
            [temp.collectionView performBatchUpdates: ^{
            [temp.collectionView deleteItemsAtIndexPaths:@[index]];
            PSKItem *item = [_fetchedResultsController objectAtIndexPath:index];
            [item MR_deleteEntity];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            } completion:nil];
    }
}

@end
