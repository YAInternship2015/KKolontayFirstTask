//
//  PSKCostomsTableViewCell.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning сюда не нужно импортировать PSKRepository, он здесь не должен использоваться
#import "PSKRepository.h"

#warning опечатка в имени класса
@interface PSKCostomsTableViewCell : UITableViewCell 

#warning Не нужно показывать наружу (в *.h файле) лишние свойства/методы. Если вы напишите метод вроде setupWithModel: (вместо Вашего addElements:), в котором ячейка сама себя будет заполнять моделью, то объявления свойств переедут в *.m файл. Почитайте еще раз принципы SOLID

@property (weak, nonatomic) IBOutlet UIImageView *imagePictur;
@property (weak, nonatomic) IBOutlet UILabel *namePicture;

#warning В этот метод должен передавать не индекс, а сама модель PSKItem. Тогда ячейка ничего не будет знать об источнике данных (датасорсе)
- (void)addElements:(NSInteger)index;

@end
