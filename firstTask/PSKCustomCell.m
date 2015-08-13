//
//  PSKCustomCell.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/11/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKCustomCell.h"

#warning перед () должен быть пробел
@interface PSKCustomCell()
#warning после @interface и перед @end должны быть пустые строки
#warning перед @property не нужна табуляция
#warning правильнее писать (nonatomic, weak)
#warning myImageView - не лучшее имя, из него непонятно, какой контент в ней должен быть отображен
    @property(weak, nonatomic) IBOutlet UIImageView *myImageView;
    @property(weak, nonatomic) IBOutlet UILabel *nameImage;
@end

@implementation PSKCustomCell

#pragma mark - Display content in cell

- (void)initWithItem:(PSKItem *)item {
#warning Здесь не должно быть пустой строки
    _myImageView.image = item.image;
    _nameImage.text = item.name;
    
}
@end
