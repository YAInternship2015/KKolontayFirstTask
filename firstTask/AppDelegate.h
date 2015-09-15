//
//  AppDelegate.h
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#warning импорт MagicalRecord надо перенести в *.h
#import <MagicalRecord/MagicalRecord.h>

#warning также щзабыл упомянуть один момент. При использовании cocoapods в .gitignore нужно добавить папку Pods, она не должна лежать в гите

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@end

