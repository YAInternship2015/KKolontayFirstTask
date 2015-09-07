//
//  PSKContainerViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKContainerViewController.h"

@implementation PSKContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentSegueIdentifier = @"tableItems";
    [self performSegueWithIdentifier:_currentSegueIdentifier sender:nil];
}

#pragma mark - switch between controlls

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"tableItems"]) {
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0]toViewController:segue.destinationViewController];
        }
        else {
            _tableViewController = segue.destinationViewController;
            [self addChildViewController:_tableViewController];
            _tableViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:_tableViewController.view];
            [_tableViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:@"collectionItems"]) {
        _collectionPresenterController = segue.destinationViewController;
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
}

#pragma mark - swap from view controller to another view controller

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
   /* if ([fromViewController isKindOfClass:[PSTableViewController class]] && [toViewController isKindOfClass:[PSKCollectionPresenterViewController class]]) {
       ((PSKCollectionPresenterViewController *)toViewController).repository = ((PSTableViewController *)fromViewController).repository;
      //  ((PSKCollectionPresenterViewController *)toViewController).repository.delegate = (PSTableViewController *)fromViewController;
    }
    if ([fromViewController isKindOfClass:[PSKCollectionPresenterViewController class]] && [toViewController isKindOfClass:[PSTableViewController class]]) {
        ((PSTableViewController *)toViewController).repository = ((PSKCollectionPresenterViewController *)fromViewController).repository;
       // ((PSTableViewController *)toViewController).repository.delegate = (PSKCollectionPresenterViewController *)fromViewController;
    }*/
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
