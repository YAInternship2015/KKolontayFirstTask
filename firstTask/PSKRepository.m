//
//  PSRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"

@implementation PSKRepository

NSMutableArray *listOfCells;
NSArray *namePictures;

#pragma mark - Initialization item and set values

-(id)init {
    
    self=[super init];
    
    namePictures = @[@"bogliasco",@"inIsrael",@"ladies",@"mountains",@"paradise",@"sunbathing",@"sunrise",@"TajMahal",@"underwater",@"young"];
    
    listOfCells = [[NSMutableArray alloc] init];
    for (int i = 0; i < namePictures.count; i++) {
        [listOfCells addObject:[[PSKItem alloc] initWithString:[namePictures objectAtIndex:i]]];
    }

    return self;
}

#pragma mark - Get cell

- (PSKItem *)valueForCustom:(NSInteger)index {
    
    return [listOfCells objectAtIndex:index];
    
}

#pragma mark - Get count of images

- (NSInteger)countOfItems {
    
    return [namePictures count];
    
}
@end
