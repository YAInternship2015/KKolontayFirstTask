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
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        _plistPath = [documentsPath stringByAppendingString:@"DictionaryOfItems.plist"];
    }
    return self;
}

#pragma mark - get instans in array

- (NSMutableArray*)readItemsFromPlist {
    if (![[NSFileManager defaultManager] fileExistsAtPath:_plistPath]) {
#warning здесь после проверки того, что по данному пути файла еще нет, нужно скопировать по этому пути оригинальный plist из бандла приложения. Иначе получалось, что Вы записывали новые данные прямо в тот файл из бандла, который при каждом запуске такой же, каким он затянут в проект
        NSString *plistFromBundlePath = [[NSBundle mainBundle] pathForResource:@"DictionaryOfItems" ofType:@"plist"];
        NSError *copyPlistToDocumentsDirError;
        if (![[NSFileManager defaultManager] copyItemAtPath:plistFromBundlePath
                                                     toPath:_plistPath
                                                      error:&copyPlistToDocumentsDirError]) {
            NSLog(@"copying error: %@", copyPlistToDocumentsDirError);
        }
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
#warning здесь приложение падает, если попытаться создать новый айтем без картинки. Нужно либо не давать создавать айтем без картинки, либо переписать логику так, чтобы приложение не падало
    [item setObject:path forKey:@"pathPicture"];
    [item setObject:name forKey:@"namePicture"];
    [_listOfItems addObject:item];
    NSError *error = nil;
   NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:_listOfItems format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    [plistData writeToFile:_plistPath atomically:YES];
}

@end
