//
//  PSKItem.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PSKItemsOfPicture.h"

@interface PSKItem : PSKItemsOfPicture

//@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong) UIImage *image;

//- (id)initWithNameAndPicture:(NSString *)name picture:(NSString *)path;

@end
