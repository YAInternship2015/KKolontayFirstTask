//
//  PSRepository.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKRepository.h"

@implementation PSKRepository
- (id)init{
    self = [super init];
#warning В замечаниях к заданию я писал, что картинку и текст необхолимо инкапсулировать в какой-то модели данных, например, PSKCard, или что-то в этом роде. В этой модели хранились бы картинка и текст. И не было бы необходимости иметь два массива
    
    self.namePictures = @[@"bogliasco",@"inIsrael",@"ladies",@"mountains",@"paradise",@"sunbathing",@"sunrise",@"TajMahal",@"underwater",@"young"];
    self.listOfPicture = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.namePictures.count; i++) {
        [self.listOfPicture addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.namePictures objectAtIndex:i]]]];
    }
    return self;
}
@end
