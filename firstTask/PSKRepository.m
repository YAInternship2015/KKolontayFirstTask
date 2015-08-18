//
//  PSRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"

@interface PSKRepository ()

@property(nonatomic, strong) NSMutableArray *listOfPictures;
@property(nonatomic, strong) NSArray *namePictures;

@end

@implementation PSKRepository


#pragma mark - Initialization item and set values

- (id)init {
    self = [super init];
    if (self != nil) {
        _namePictures = @[@"bogliasco", @"inIsrael", @"ladies", @"mountains", @"paradise", @"sunbathing", @"sunrise", @"TajMahal", @"underwater", @"young"];
        _listOfPictures = [[NSMutableArray alloc] init];
        for (int i = 0; i < _namePictures.count; i++) {
            [_listOfPictures addObject:[[PSKItem alloc] initWithString:[_namePictures objectAtIndex:i]]];
        }
    }
    return self;
}

#pragma mark - Get cell

- (PSKItem *)itemAtIndex:(NSInteger)index {
    return [_listOfPictures objectAtIndex:index];
}

#pragma mark - Get count of images

- (NSInteger)countOfItems {
    return [_namePictures count];
}

@end
