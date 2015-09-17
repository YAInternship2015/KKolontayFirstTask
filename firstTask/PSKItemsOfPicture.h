//
//  PSKItemsOfPicture.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/16/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>


@interface PSKItemsOfPicture : NSManagedObject

@property (nonatomic, retain) NSString * namePicture;
@property (nonatomic, retain) NSString * pathPicture;
@property (nonatomic, strong) UIImage *image;
- (void)setPictureFromAsset;

@end
