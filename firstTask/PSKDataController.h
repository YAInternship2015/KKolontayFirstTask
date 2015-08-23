//
//  PSKDataController.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/22/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSKItem.h"

@interface PSKDataController : NSObject

- (NSMutableArray*)readItemsFromPlist;
- (void)writeItemToPlist:(NSString *)name pathImage:(NSString *)path;

@end
