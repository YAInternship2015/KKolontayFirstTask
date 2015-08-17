//
//  PSKCustomCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/11/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomCell.h"

@interface PSKCustomCell ()

#warning перед открывающейся скобкой должен быть пробел
@property(nonatomic, weak) IBOutlet UIImageView *imageDisplay;
@property(nonatomic, weak) IBOutlet UILabel *nameImage;

@end

@implementation PSKCustomCell

#pragma mark - Display content in cell

- (void)initWithItem:(PSKItem *)item {
    _imageDisplay.image = item.image;
    _nameImage.text = item.name;
#warning здесь не нужна пустая строка
}

@end
