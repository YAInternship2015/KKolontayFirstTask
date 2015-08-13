//
//  PSKCustomCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/11/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomCell.h"

@interface PSKCustomCell()
    @property(weak, nonatomic) IBOutlet UIImageView *myImageView;
    @property(weak, nonatomic) IBOutlet UILabel *nameImage;
@end

@implementation PSKCustomCell

#pragma mark - Display content in cell

- (void)initWithItem:(PSKItem *)item {

    _myImageView.image = item.image;
    _nameImage.text = item.name;
    
}
@end
