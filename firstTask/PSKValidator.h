//
//  Validator.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/23/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSKValidator : NSObject

+ (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error;

@end
