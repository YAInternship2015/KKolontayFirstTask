//
//  PSKAddItemViewController.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKRepository.h"


@interface PSKAddItemViewController : UIViewController <
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
>

#warning я все же за то, чтобы у каждый контроллер сам создавал себе датасорс, чтобы датасорс был не синглтоном. Но если вы уже сделали так, то по крайней мере перенесите свойство в *.m, а в *.h покажите сеттер для этого свойства. Та же ситуация с остальными контроллерами
@property (nonatomic, strong) PSKRepository *repository;

@end
