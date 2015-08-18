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
    if (self) {
        _name = name;
        _image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", _name]];
    }
    return self;
}

@end
