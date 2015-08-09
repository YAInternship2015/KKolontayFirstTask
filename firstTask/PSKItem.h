//
//  PSKItem.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSKItem : NSObject {
    @private
    UIImage *imageCell;
    NSString *nameCell;
}

- (id)initWithString:(NSString *)name;

- (NSString *)getName;

- (UIImage *)getImage;

@end
