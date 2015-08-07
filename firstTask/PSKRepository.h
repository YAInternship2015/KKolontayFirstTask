//
//  PSRepository.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSKRepository : NSObject
@property (atomic, strong) NSMutableArray *listOfPicture;
@property (atomic, strong) NSArray *namePictures;
- (id)init;
@end
