//
//  PSKCostomsTableViewCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCostomsTableViewCell.h"

@implementation PSKCostomsTableViewCell

#pragma mark - Init instance

#warning в таком init нет смысла, он ничего не привносит в стандартную реализацию. Можно смело его удалять
-(id)init {
    self = [super init];
    return self;
}

#pragma mark - Set value image and string

- (void)addElements:(NSInteger)index {
    
    _imagePictur.image = [[[PSKRepository sharedInstance] getCellImage:index] getImage];
    
    _namePicture.text = [[[[PSKRepository sharedInstance] getCellImage:index] getName] capitalizedString];
}
@end
