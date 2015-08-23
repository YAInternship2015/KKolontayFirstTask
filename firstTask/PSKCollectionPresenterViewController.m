//
//  PSKCollectionPresenterViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCollectionPresenterViewController.h"
#import "PSKItemCollectionViewCell.h"

@implementation PSKCollectionPresenterViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - coutn of cells in table

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _repository.countOfItems;
}

#pragma  mark - configure cells of table

- (PSKItemCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PSKItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    PSKItem *item = [_repository itemAtIndex:[indexPath row]];
    [cell setupWithItem:item];
    return cell;
}

@end
