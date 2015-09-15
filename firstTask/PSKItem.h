//
//  PSKItem.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#warning Вам не нужны две модели PSKItem и ItemsOfPicture. Ваша модель PSKItem доджны стать наследником NSManagedObject и в коде Вы работаете только с ней
@interface PSKItem : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) UIImage *image;

- (id)initWithNameAndPicture:(NSString *)name picture:(NSString *)path;

@end
