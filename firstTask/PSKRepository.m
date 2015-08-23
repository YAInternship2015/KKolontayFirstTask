//
//  PSRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"
#import "PSKDataController.h"


@interface PSKRepository ()

@property (nonatomic, strong) NSMutableArray *listOfPictures;
@property (nonatomic, strong, readonly) PSKDataController *data;

@end

@implementation PSKRepository


#pragma mark - Initialization item and set values

- (id)init {
    self = [super init];
    if (self) {
        _data = [[PSKDataController alloc] init];
        [self load];
           }
    return self;
}

#pragma mark - Get cell

- (PSKItem *)itemAtIndex:(NSInteger)index {
    return [_listOfPictures objectAtIndex:index];
}

#pragma mark - Get count of images

- (NSInteger)countOfItems {
    return [_listOfPictures count];
}

#pragma mark - load to memmory

-(void)load {
    NSArray *items = [_data readItemsFromPlist];
    _listOfPictures = [[NSMutableArray alloc] init];
    for (int i = 0; i < items.count; i++) {
        NSDictionary *temp = [items objectAtIndex:i];
        NSString *name = [temp objectForKey:@"namePicture"];
        NSString *path = [temp objectForKey:@"pathPicture"];
        [_listOfPictures addObject:[[PSKItem alloc] initWithNameAndPicture:name picture:path]];
    }
}

@end
