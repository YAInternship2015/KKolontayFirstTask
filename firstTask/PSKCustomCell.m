//
//  PSKCustomCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/11/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomCell.h"

@interface PSKCustomCell ()

@property(nonatomic, weak) IBOutlet UIImageView *imageDisplay;
@property(nonatomic, weak) IBOutlet UILabel *nameImage;

@end

@implementation PSKCustomCell

#pragma mark - Display content in cell

- (void)initWithItem:(PSKItem *)item {
<<<<<<< HEAD

    _myImageView.image = item.image;
=======
    _imageDisplay.image = item.image;
>>>>>>> 96d974d35c47c57acd278c11ce4c9323b2e10a3d
    _nameImage.text = item.name;
    
}

@end
