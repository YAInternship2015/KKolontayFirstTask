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
    if (self) {
        _name = name;
        if ([path hasPrefix:@"assets-library:"]) {
            ALAssetsLibrary *library = [ALAssetsLibrary new];
            __weak typeof(self) weakSelf = self;
            [library assetForURL:[NSURL URLWithString:path]
                     resultBlock:^(ALAsset *asset) {
                         CGImageRef imageRef = [[asset defaultRepresentation] fullResolutionImage];
                         UIImage *fullResolutionImage = [UIImage imageWithCGImage:imageRef];
                         weakSelf.image = fullResolutionImage;
                     } failureBlock:^(NSError *error) {
                         NSLog(@"PSKItem creating error: %@", error);
                     }];
            
        } else {
            _image = [UIImage imageNamed:path];
        }
    }
    return self;
}

@end
