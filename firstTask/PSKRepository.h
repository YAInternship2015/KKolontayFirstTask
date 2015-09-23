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

#warning fetchedResultsController не должен быть показан в *.h, это детали внутренней реализации. Вся работа с выборкой fetchedResultsController должна происходить через интерфейс PSKRepository
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
- (NSMutableArray *)getItems;
- (void) deleteItem:(NSIndexPath *)index;
- (void)addItem:(NSString *)name pathPicture:(NSString *)path;

@end
