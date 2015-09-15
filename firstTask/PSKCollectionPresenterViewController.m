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
#import "PSKItemsOfPicture.h"

@interface PSKCollectionPresenterViewController () <
NSFetchedResultsControllerDelegate,
UIGestureRecognizerDelegate
>

@end

@interface PSKCollectionPresenterViewController ()

#warning не совсем понял, куда делся класс-датасорс, в котором должен жить fetchedResultsController. Контроллер должен все так же не знать, откуда берутся данные, он их получает у датасорса. Датасорс настраивает NSFetchedResultsController и выдает данные из этого контроллера, а не из выборки [ItemsOfPicture MR_findAll]. При изменении данных в NSFetchedResultsController датасорс говорит контроллеру, что нужно обновить данные в таблице
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PSKCollectionPresenterViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fetchedResultsController = [PSKItemsOfPicture MR_fetchAllSortedBy:@"namePicture" ascending:YES withPredicate:nil groupBy:nil delegate:self];
    self.items = [[NSMutableArray alloc] initWithArray:[PSKItemsOfPicture MR_findAll]];
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
    PSKItem *memberOfCell = [[PSKItem alloc]initWithNameAndPicture:item.namePicture picture:item.pathPicture];
    [cell setupWithItem:memberOfCell];
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
        [self deleteContent:indexPath];
    });
}

#warning удаление должно происходить в датасорсе, NSFetchedResultsController отреагирует на удаление модели и датасорс оповестит контроллер, что данные изменились

@end
