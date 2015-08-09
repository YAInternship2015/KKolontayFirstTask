//
//  PSRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"

@implementation PSKRepository

+ (PSKRepository *)sharedInstance
{
    static dispatch_once_t predicate = 0;
    static id sharedObject = nil;
      dispatch_once(&predicate, ^{
          if (sharedObject == nil) {
        sharedObject = [[self alloc] init];
              [sharedObject setValues];        }
    });
    return sharedObject;
}

#pragma mark - Set values

- (void) setValues {
    namePictures = @[@"bogliasco",@"inIsrael",@"ladies",@"mountains",@"paradise",@"sunbathing",@"sunrise",@"TajMahal",@"underwater",@"young"];
    
    listOfCells = [[NSMutableArray alloc] init];
    for (int i = 0; i < namePictures.count; i++) {
        [listOfCells addObject:[[PSKItem alloc] initWithString:[namePictures objectAtIndex:i]]];
    }

}

#pragma mark - Get cell

- (PSKItem *)getCellImage:(NSInteger)index {
    return [listOfCells objectAtIndex:index];
}

#pragma mark - Get count of images

- (NSInteger)getCount {
    return [namePictures count];
}
@end
