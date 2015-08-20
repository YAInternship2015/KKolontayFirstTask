//
//  PSKCustomSegue.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomSegue.h"
#import "PSTableViewController.h"
#import "PSKContainerViewController.h"

@implementation PSKCustomSegue

- (void)perform
{
    PSTableViewController *tableVeiwController = [[PSTableViewController alloc]init];
    [[self sourceViewController] presentModalViewController:tableVeiwController animated:YES];
}

@end
