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

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) PSKRepository *repository;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipePressGestureRecognizer;

@end

@implementation PSKCollectionPresenterViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _fetchedResultsController = _repository.getFetchedResultsController;
    [_fetchedResultsController setDelegate:self];
    [self.collectionView addGestureRecognizer:_swipePressGestureRecognizer];
}

#pragma mark - set repository

- (void)setRepository:(PSKRepository *)repository {
    _repository =repository;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - coutn of cells in table

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [[_repository getItems] count];
}

#pragma  mark - configure cells of table

- (PSKItemCollectionViewCell *)collectionView:(UICollectionView *)collectionView
                       cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PSKItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    PSKItemsOfPicture *item = [[_repository getItems] objectAtIndex:indexPath.row];
    [cell setupWithItem:item];
    return cell;
}

#pragma mark - renew collection

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.collectionView reloadData];
}

#pragma mark - gecture delete item

- (IBAction)deleteItem:(UISwipeGestureRecognizer *)gestureRecognizer {
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    if (indexPath != nil) {
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        CGContextRef context = UIGraphicsGetCurrentContext();
        context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationDuration:1.5];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cell cache:YES];
        [UIView commitAnimations];
        double delay = 1/2;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self.collectionView performBatchUpdates: ^{
                [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
                [_repository deleteItem:indexPath];
            } completion:nil];
       
            });
        }
}

@end
