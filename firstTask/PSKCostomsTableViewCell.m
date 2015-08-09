//
//  PSKCostomsTableViewCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCostomsTableViewCell.h"

@implementation PSKCostomsTableViewCell

- (PSKCostomsTableViewCell *)addElements:(NSInteger)index {
    UIImageView * imageViewCell = (UIImageView *)[self viewWithTag:2];
    imageViewCell.image = [[[PSKRepository sharedInstance] getCellImage:index] getImage];
    
    UILabel *label = (UILabel *)[self viewWithTag:1];
    NSString* nameOfPicture = [[[[PSKRepository sharedInstance] getCellImage:index] getName] capitalizedString] ;
    label.text = nameOfPicture;
    return self;
}
@end
