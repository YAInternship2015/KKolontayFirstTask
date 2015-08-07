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
    self.namePictures = @[@"bogliasco",@"inIsrael",@"ladies",@"mountains",@"paradise",@"sunbathing",@"sunrise",@"TajMahal",@"underwater",@"young"];
    self.listOfPicture = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.namePictures.count; i++) {
        [self.listOfPicture addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.namePictures objectAtIndex:i]]]];
    }
    return self;
}
@end
