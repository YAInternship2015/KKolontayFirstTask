//
//  PSKContainerViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKContainerViewController.h"

@interface PSKContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;

@end

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
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:@"addItem"]) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
}

#pragma mark - swap from view controller to another view controller 

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion: ^(BOOL finished){
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
