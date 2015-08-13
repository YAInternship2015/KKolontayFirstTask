//
//  PSRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"

@implementation PSKRepository

#warning эти вещи должны быть объявлены как @property внутри *.m файла
#warning listOfCells - зачем здесь слово Cell? здесь ведь не хранятся ячейки
NSMutableArray *listOfCells;
NSArray *namePictures;

#pragma mark - Initialization item and set values

-(id)init {
#warning здесь не должно быть пустой строки. Перед и после "=" должны быть пробелы
    self=[super init];
#warning здесь также не должно быть пустой строки. В объявлении массива после запятой перед сделующим элементом должен быть пробел
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
