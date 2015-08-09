//
//  PSKItem.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKItem.h"

@implementation PSKItem

#pragma mark - Initialization cell for table

- (id)initWithString:(NSString *)name {
    self = [super init];
    
    nameCell = name;
    imageCell = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", nameCell]];
    
    return self;
}

#pragma mark - Get name cell

- (NSString *)getName {
    return nameCell;
}

#pragma mark - Get image cell

- (UIImage *)getImage {
    return imageCell;
}

@end
