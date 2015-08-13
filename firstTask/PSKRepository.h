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

#warning Имя метода не говорит ничего о самом методе. А здесь по факту мы получаем модель PSKItem по индексу. "говорящее" имя для данного метода - itemAtIndex:
- (PSKItem *)valueForCustom:(NSInteger)index;
#warning Здесь не должно быть пустой строки
- (NSInteger)countOfItems;

@end
