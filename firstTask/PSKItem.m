//
//  PSKItem.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKItem.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface PSKItem ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;

@end

@implementation PSKItem

#pragma mark - Initialization cell for table

- (id)initWithNameAndPicture:(NSString *)name picture:(NSString *)path {
    self = [super init];
#warning не совсем понял, зачем здесь танцы с GCD, да и получение картинки из ассетов лучше вынести в отдельный метод
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    if (self) {
        _name = name;
       
       if ([path hasPrefix:@"assets-library:"]) {
            ALAssetsLibrary *library = [ALAssetsLibrary new];
            __weak typeof(self) weakSelf = self;
           dispatch_async(queue, ^{
            [library assetForURL:[NSURL URLWithString:path]
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
            _image = [UIImage imageNamed:path];
        }
    }
    return self;
}

@end
