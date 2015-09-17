//
//  PSKRepository.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/15/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PSKRepository : NSObject

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
- (NSMutableArray *)getItems;
- (void) deleteItem:(NSIndexPath *)index;
- (void)addItem:(NSString *)name pathPicture:(NSString *)path;

@end
