//
//  PSKItem.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKItem.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation PSKItem

@synthesize image;

#pragma mark - Initialization cell for table

- (id)init {
    self = [super init];
    if (self) {
        [self setPictureFromAsset];
    }
    return self;
}

#pragma mark - get picture from asset

- (void)setPictureFromAsset {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    if ([super.pathPicture hasPrefix:@"assets-library:"]) {
        ALAssetsLibrary *library = [ALAssetsLibrary new];
        __weak typeof(self) weakSelf = self;
        dispatch_async(queue, ^{
            [library assetForURL:[NSURL URLWithString:super.pathPicture]
                     resultBlock:^(ALAsset *asset) {
                         CGImageRef imageRef = [[asset defaultRepresentation] fullResolutionImage];
                         UIImage *fullResolutionImage = [UIImage imageWithCGImage:imageRef];
                         weakSelf.image = fullResolutionImage;
                         dispatch_semaphore_signal(sema);
                     } failureBlock:^(NSError *error) {
                         NSLog(@"PSKItem creating error: %@", error);
                         dispatch_semaphore_signal(sema);
                     }];
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    } else {
        self.image = [UIImage imageNamed:super.pathPicture];
    }
}

@end
