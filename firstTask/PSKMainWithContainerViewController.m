 //
//  PSKMainWithContainerViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKMainWithContainerViewController.h"
#import "PSKContainerViewController.h"
#import "PSKAddItemViewController.h"

@interface PSKMainWithContainerViewController ()

@property (nonatomic, strong) PSKContainerViewController *containerViewControllers;
@property (nonatomic, strong) PSKAddItemViewController *addItemViewController;
@property (nonatomic, strong) NSString * stringToPerformName;
- (IBAction)changeView:(id)sender;

@end

@implementation PSKMainWithContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _stringToPerformName = @"collectionItems";
}

#pragma mark - load main view

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"startMainWindow"]) {
        _containerViewControllers = segue.destinationViewController;
    }
  }

#pragma  mark - switch to collection view controller

- (IBAction)changeView:(id)sender {
    if ([_stringToPerformName isEqualToString:@"collectionItems"]) {
        [_containerViewControllers swapViewControllers:_stringToPerformName];
        _stringToPerformName = @"tableItems";
    }
    else {
        [_containerViewControllers swapViewControllers:_stringToPerformName];
        _stringToPerformName = @"collectionItems";
    }
}

@end
