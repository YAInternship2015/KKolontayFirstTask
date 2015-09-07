//
//  Validator.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/23/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKValidator.h"

@implementation PSKValidator

+ (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
    if (title.length > 3) {
        return true;
    }
    else {
        NSDictionary * userInfo = @{
                                    NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                    NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"String less then three letters", nil),
                                    NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Have you tried enter it agan", nil)
                                    };
        *error = [NSError errorWithDomain:NSURLErrorDomain code:-57 userInfo:userInfo];
    }
    if (title == nil) {
        return true;
    }
    else {
        NSDictionary * userInfo = @{
                                    NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                    NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Please, select picture", nil),
                                    NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Please, select picture", nil)
                                    };
        *error = [NSError errorWithDomain:NSURLErrorDomain code:-57 userInfo:userInfo];
    }

    return false;
}
@end
