//
//  PSKCollectionPresenterViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCollectionPresenterViewController.h"
#import "PSKItemCollectionViewCell.h"
#import "PSKItemsOfPicture.h"
#import <CoreData/CoreData.h>


@interface PSKCollectionPresenterViewController () <
    UIGestureRecognizerDelegate,
    NSFetchedResultsControllerDelegate
>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation PSKCollectionPresenterViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [_repository getItems];
    _fetchedResultsController = _repository.fetchedResultsController;
    [_fetchedResultsController setDelegate:self];
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
    PSKItemsOfPicture *item = [self.items objectAtIndex:indexPath.row];
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
        if (_items.count > 0 && _items.count >= indexPath.row) {
            [self.collectionView performBatchUpdates: ^{
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
            [_repository deleteItem:indexPath];
            } completion:nil];
        }
    });
}

@end
