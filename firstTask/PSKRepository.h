//
//  PSRepository.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PSKItem.h"

@interface PSKRepository : NSObject

- (PSKItem *)itemAtIndex:(NSInteger)index;
- (NSInteger)countOfItems;

@end
