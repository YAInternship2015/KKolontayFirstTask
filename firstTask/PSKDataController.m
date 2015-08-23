//
//  PSKDataController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/22/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKDataController.h"

@interface PSKDataController ()

@property (nonatomic, strong) NSString *plistPath;

@end

@implementation PSKDataController

- (id)init {
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        _plistPath = [documentsPath stringByAppendingString:@"DictionaryOfItems.plist"];
    }
    return self;
}

#pragma mark - get instans in array

- (NSArray*)readItemsFromPlist {
    if (![[NSFileManager defaultManager] fileExistsAtPath:_plistPath]) {
        _plistPath = [[NSBundle mainBundle] pathForResource:@"DictionaryOfItems" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:_plistPath];
    NSError *error = nil;
    NSPropertyListFormat format;
    return (NSArray *)[NSPropertyListSerialization propertyListWithData:plistXML options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
}

#pragma mark - save item in plist

- (void)writeItemToPlist:(NSString *)name pathImage:(NSString *)path {
    NSDictionary *item = @{@"namePicture" : name, @"pathPicture" : path};
    [item writeToFile:_plistPath atomically:YES];
}

@end
