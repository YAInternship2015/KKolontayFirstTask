//
//  PSKCustomCollectionItemsSegue.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomCollectionItemsSegue.h"
#import "PSKCollectionPresenterViewController.h"

@implementation PSKCustomCollectionItemsSegue

- (void)perform
{
    PSKCollectionPresenterViewController *collectionItems = [[PSKCollectionPresenterViewController alloc]init];
    [[self sourceViewController] presentModalViewController:collectionItems animated:YES];
}

@end
