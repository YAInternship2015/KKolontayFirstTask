//
//  AppDelegate.h
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning По архитектуре сейчас все хорошо. Осталось закрыть вопросы по именованию методов/переменных и форматированию кода. На первый взгляд это мелочи, но из них строится представление о уровне разработчике и его понимании языка, на котором он пишет. Имена должны быть "говорящими", язык позволяет писать длинные имена методов с именованием каждого параметра, потому, посмотрев на имя метода, должно быть понятно, какие данные он принимает на вход, что делает внутри и что возвращает. По имени переменной должно быть понятно, какие данные она хранит и какого она типа. Настоятельно рекомендую перечитать эппловую документацию https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html,  https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Conventions/Conventions.html

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@end

