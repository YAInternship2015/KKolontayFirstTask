//
//  PSKItemsOfPicture.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 9/16/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKItemsOfPicture.h"
#import <AssetsLibrary/AssetsLibrary.h>


@implementation PSKItemsOfPicture

@dynamic namePicture;
@dynamic pathPicture;
@synthesize image;

#pragma mark - set picture into cell
- (void)setPictureFromAsset {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    if ([self.pathPicture hasPrefix:@"assets-library:"]) {
        ALAssetsLibrary *library = [ALAssetsLibrary new];
        __weak typeof(self) weakSelf = self;
        dispatch_async(queue, ^{
            [library assetForURL:[NSURL URLWithString:self.pathPicture]
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
        self.image = [UIImage imageNamed:self.pathPicture];
    }
}

@end
