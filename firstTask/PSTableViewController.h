//
//  TableViewController.h
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKRepository.h"

@interface PSTableViewController : UITableViewController

#warning В файле *.h нужно показывать минимум информации о том, как устроен класс внутри. Например, никому извне нет необходимости знать, что внутри себя PSTableViewController использует объект repository. Поэтому объявление данного свойства следовало разместить в *.m файле
@property PSKRepository *repository;
@end
