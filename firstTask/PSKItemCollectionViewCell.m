//
//  PSKItemCollectionViewCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKItemCollectionViewCell.h"

@interface PSKItemCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *imageItem;

@end

@implementation PSKItemCollectionViewCell

#pragma mark - setup picture in cell

- (void)setupWithItem:(PSKItem *)item {
    _imageItem.image = item.image;
}

@end
