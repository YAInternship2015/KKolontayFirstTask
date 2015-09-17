//
//  PSKCustomCell.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/11/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKItemsOfPicture.h"

@interface PSKCustomCell : UITableViewCell

- (void)setupWithItem:(PSKItemsOfPicture *)item;

@end
