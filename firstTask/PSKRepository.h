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

@interface PSKRepository : NSObject {
#warning используйте @property вместо ivar'ов, не нужно показывать массивы в *.h файле, перенесите их в *.m
    @private
    NSMutableArray *listOfCells;
    NSArray *namePictures;
}

+ (PSKRepository *)sharedInstance;

#warning в принципах именования obj-c в именах геттеров не пишется слово "get"
- (PSKItem *)getCellImage:(NSInteger)index;

#warning из имени метода не ясно, getCount чего? Здесь больше подойте countOfItems, или numberOfItems
- (NSInteger)getCount;
@end
