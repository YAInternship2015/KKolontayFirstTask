//
//  PSRepository.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/7/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSKRepository : NSObject

#warning Здесь также стоит задуматься об инкапсуляции. По сути вью контроллеру, которому нужны данные для отображения, нет необходимости знать, откуда берутся данные в PSKRepository, как они там храняться. Для отобрадения данных в таблице ему достаточно знать, сколько всего моделей есть в PSKRepository, и какая модель находится по индексу i (индекс ячейки в секции). Поэтому нет смысла показывать в *.h файле listOfPicture (он еще и mutable, то есть его может изменить извне кто угодно, что есть плохо) и namePictures. Достаточно показать два метода: один из них возвращает количество элементов, которые есть в repository, второй возвращает конкретный элемент по индексу

#warning спецификатор atomic следует испольщовать только тогда, когда в этом есть прямая необходимость, когда работа с данным свойством происходит из рахных птоков. В подавляющем большинстве случаев следует использовать nonatomic, он работает быстрее. Чтобы понять разницу, почитайте, например, это http://stackoverflow.com/questions/588866/whats-the-difference-between-the-atomic-and-nonatomic-attributes
@property (atomic, strong) NSMutableArray *listOfPicture;
@property (atomic, strong) NSArray *namePictures;

#warning метод init можно вызвать у объекта и не показывая его в *.h файле
- (id)init;
@end
