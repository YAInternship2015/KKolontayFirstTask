//
//  PSKContainerViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKContainerViewController.h"
#import "PSKRepository.h"

@interface PSKContainerViewController ()

@property (nonatomic, strong) PSKRepository *repository;
@property (nonatomic, strong) PSTableViewController *tableViewController;
@property (nonatomic, strong) PSKCollectionPresenterViewController *collectionPresenterController;
@property (nonatomic, strong) PSKAddItemViewController * addItemViewController;
@property (nonatomic, strong) NSString *currentSegueIdentifier;

@end

@implementation PSKContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentSegueIdentifier = @"tableItems";
    [self performSegueWithIdentifier:_currentSegueIdentifier sender:nil];
}

#pragma mark - set repository

- (void)setRepository:(PSKRepository *)repository {
    _repository = repository;
}

#pragma mark - switch between controlls

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"tableItems"]) {
        _tableViewController = segue.destinationViewController;
        [_tableViewController setRepository:_repository];
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0]toViewController:segue.destinationViewController];
        }
        else {
            [self addChildViewController:_tableViewController];
            _tableViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:_tableViewController.view];
            [_tableViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:@"collectionItems"]) {
            _collectionPresenterController = segue.destinationViewController;
            [_collectionPresenterController setRepository:_repository];
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
}

#pragma mark - swap from view controller to another view controller

- (void)swapFromViewController:(UIViewController *)fromViewController
              toViewController:(UIViewController *)toViewController {
    [self addChildViewController:toViewController];
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [fromViewController willMoveToParentViewController:nil];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion: ^(BOOL done) {
               [fromViewController removeFromParentViewController];
               [toViewController didMoveToParentViewController:self];
    }];
}

#pragma mark - change current segue identificator

- (void)swapViewControllers:(NSString *)segueIdentifier {
    _currentSegueIdentifier = segueIdentifier;
    [self performSegueWithIdentifier:_currentSegueIdentifier sender:nil];
}

@end
