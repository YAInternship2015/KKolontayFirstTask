//
//  PSKContainerViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKContainerViewController.h"
#import "PSKAddItemViewController.h"
#import "PSKRepository.h"

@interface PSKContainerViewController ()

@property (nonatomic, strong) PSKRepository *repository;

@end

@implementation PSKContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentSegueIdentifier = @"tableItems";
    _repository = [[PSKRepository alloc]init];
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
        _tableViewController.repository = _repository;
    }
    else if ([segue.identifier isEqualToString:@"collectionItems"]) {
            _collectionPresenterController = segue.destinationViewController;
            _collectionPresenterController.repository = _repository;
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
    else if ([segue.identifier isEqualToString:@"addItem"]) {
            _addItemViewController = segue.destinationViewController;
            _addItemViewController.repository = _repository;
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
