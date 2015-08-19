//
//  PSKMainWithContainerViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKMainWithContainerViewController.h"
#import "PSKContainerViewController.h"

@interface PSKMainWithContainerViewController ()

@property (weak, nonatomic) PSKContainerViewController *containerViewControllers;

- (IBAction)addItem:(id)sender;
- (IBAction)changeView:(id)sender;

@end

@implementation PSKMainWithContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - load main view

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"startMainWindow"]) {
        _containerViewControllers = segue.destinationViewController;
    }
}

#pragma  mark - switch view to add item view controller

- (IBAction)addItem:(id)sender {
    [_containerViewControllers swapViewControllers:@"addItem"];
}

#pragma  mark - switch to collection view controller

- (IBAction)changeView:(id)sender {
    [_containerViewControllers swapViewControllers:@"collectionItems"];
}

@end
