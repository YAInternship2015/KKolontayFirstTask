//
//  PSKCollectionPresenterViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCollectionPresenterViewController.h"
#import "PSKItemCollectionViewCell.h"
#import "PSKItem.h"


@interface PSKCollectionPresenterViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PSKCollectionPresenterViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.fetchedResultsController = [PSKItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
    self.items = [_repository getItems];
    [self.collectionView addGestureRecognizer:[self addRecognizer]];
}

#pragma mark - add recognizer

- (UILongPressGestureRecognizer *) addRecognizer {
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5;
    lpgr.delegate = self;
    return lpgr;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - coutn of cells in table

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [_items count];
}

#pragma  mark - configure cells of table

- (PSKItemCollectionViewCell *)collectionView:(UICollectionView *)collectionView
                       cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PSKItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    PSKItem *item = [self.items objectAtIndex:indexPath.row];
    //PSKItem *memberOfCell = [[PSKItem alloc]initWithNameAndPicture:item.namePicture picture:item.pathPicture];
    [cell setupWithItem:item];
    return cell;
}

#pragma mark - renew collection

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.collectionView reloadData];
    [self viewDidLoad];
}

#pragma mark - gecture delete

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    CGContextRef context = UIGraphicsGetCurrentContext();
    context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cell cache:YES];
    [UIView commitAnimations];
    double delay = 1/2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (_items.count > 0) {
            [self.collectionView performBatchUpdates: ^{
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
            //PSKItem *item = [_fetchedResultsController objectAtIndexPath:indexPath];
           // [item MR_deleteEntity];
           // [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            [_repository deleteItem:indexPath];
            } completion:nil];
        }
    });
}

@end
