//
//  PSKCustomCell.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/11/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKItem.h"

@interface PSKCustomCell : UITableViewCell
#warning после @interface и перед @end должны быть пустые строки
- (void)initWithItem:(PSKItem *)item;

@end
