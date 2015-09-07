//
//  PSKCollectionPresenterViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCollectionPresenterViewController.h"
#import "PSKItemCollectionViewCell.h"
#import "MagicalRecord/MagicalRecord.h"
#import "ItemsOfPicture.h"

@interface PSKCollectionPresenterViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSArray *items;

@end

@implementation PSKCollectionPresenterViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fetchedResultsController = [ItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
    self.items = [ItemsOfPicture MR_findAll];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - coutn of cells in table

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id sectionInfo = [[self.fetchedResultsController sections]objectAtIndex:section];
    return[sectionInfo numberOfObjects];
}

#pragma  mark - configure cells of table

- (PSKItemCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PSKItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    ItemsOfPicture *item = [self.items objectAtIndex:indexPath.row];
    PSKItem *memberOfCell = [[PSKItem alloc]initWithNameAndPicture:item.namePicture picture:item.pathPicture];
    [cell setupWithItem:memberOfCell];
    return cell;
}

#pragma mark - renew collection

-(void)dataWasChanged {
    [self.collectionView reloadData];
}

@end
