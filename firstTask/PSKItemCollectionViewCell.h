//
//  PSKItemCollectionViewCell.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/20/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKItem.h"

@interface PSKItemCollectionViewCell : UICollectionViewCell

- (void)setupWithItem:(PSKItem *)item;
@end
