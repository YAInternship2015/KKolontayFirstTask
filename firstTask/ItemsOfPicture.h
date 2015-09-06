//
//  ItemsOfPicture.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/5/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ItemsOfPicture : NSManagedObject

@property (nonatomic, retain) NSString * namePicture;
@property (nonatomic, retain) NSString * pathPicture;

@end