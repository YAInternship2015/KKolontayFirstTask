//
//  PSKRepository.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/15/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSKRepository : NSObject

- (NSMutableArray *)getItems;
- (void) deleteItem:(NSIndexPath *)index;
- (void)addItem:(NSString *)name pathPicture:(NSString *)path;

@end
