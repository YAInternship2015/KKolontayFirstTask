//
//  PSKCustomAddItemSegue.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomAddItemSegue.h"
#import "PSKAddItemViewController.h"

@implementation PSKCustomAddItemSegue

- (void)perform
{
    PSKAddItemViewController *addItem = [[PSKAddItemViewController alloc]init];
    [[self sourceViewController] presentModalViewController:addItem animated:YES];
}

@end
