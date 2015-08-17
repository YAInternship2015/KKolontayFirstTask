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

#warning если метод начинается на слово "init", то он должен создавать объект и возвращать его. Здесь же никакого создания не происходит, лучше init заменить на setup
- (void)initWithItem:(PSKItem *)item;

@end
