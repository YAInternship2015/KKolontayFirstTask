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
#warning массив namePictures Вам не нужен. Достаточно listOfPictures
@property(nonatomic, strong) NSArray *namePictures;

@end

@implementation PSKRepository


#pragma mark - Initialization item and set values
#warning перед открывающейся скобкой должен быть пробел
-(id)init {
    self = [super init];
    if (self != nil) {
#warning внутри блока if должен присутствовать сдвиг вправо
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
#warning здесь не нужна пустая строка
}

#pragma mark - Get count of images

- (NSInteger)countOfItems {
    return [_namePictures count];
#warning здесь не нужна пустая строка
}

@end
