//
//  PSKItem.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSKItem : NSObject {
    @private
#warning Избегайте использования ivar'ов, используйте @property, так будет проще изменить поведение в классах-наследниках. Эти проперти надо объявлять readwrite в *.m файле, и readonly в *.h файле, чтобы извне нельзя было модифицировать эти значения

#warning зачем здесь "cell" в названиях? какое отношение имеет модель к ячейке?
    UIImage *imageCell;
    NSString *nameCell;
}

- (id)initWithString:(NSString *)name;

#warning если в *.h файле объявить readonly свойства image и name, то эти методы будут не нужны
- (NSString *)getName;

- (UIImage *)getImage;

@end
