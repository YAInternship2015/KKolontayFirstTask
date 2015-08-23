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
@property (nonatomic, strong) NSMutableArray* listOfItems;

@end

@implementation PSKDataController

- (id)init {
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSAllDomainsMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        _plistPath = [documentsPath stringByAppendingString:@"DictionaryOfItems.plist"];
    }
    return self;
}

#pragma mark - get instans in array

- (NSMutableArray*)readItemsFromPlist {
    if (![[NSFileManager defaultManager] fileExistsAtPath:_plistPath]) {
        _plistPath = [[NSBundle mainBundle] pathForResource:@"DictionaryOfItems" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:_plistPath];
    NSError *error = nil;
    NSPropertyListFormat format;
    _listOfItems = (NSMutableArray *)[NSPropertyListSerialization propertyListWithData:plistXML options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    return _listOfItems;
}

#pragma mark - save item in plist

- (void)writeItemToPlist:(NSString *)name pathImage:(NSString *)path {
    NSMutableDictionary *item =[[NSMutableDictionary alloc]init];
    [item setObject:path forKey:@"pathPicture"];
    [item setObject:name forKey:@"namePicture"];
    [_listOfItems addObject:item];
     NSError *error = nil;
    NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:_listOfItems format:NSPropertyListXMLFormat_v1_0 options:NSPropertyListWriteInvalidError error:&error];
    [plistData writeToFile:_plistPath atomically:YES];
}

@end
