//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"

@interface PSTableViewController ()

@end

@implementation PSTableViewController

#warning Обратите внимание на форматирование кода, я оставлял ссылку на гайдлайны Ялантис, которых мы придерживаемся
- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.repository == nil)
    self.repository = [[PSKRepository alloc] init];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.repository.listOfPicture.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    UIImage *image = [self.repository.listOfPicture objectAtIndex:indexPath.row];
#warning не совсем понимаю, зачем здесь необходимо было пережимать картинку. UIImageView умеет делать это самостоятельно, по правилам заданного ей contentMode. Подробнее об этом можно почитать тут http://notissimus.com/blog/masshtabirovanie_izobrazhenij_v_prilozheniyax_dlya_ios/
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(75, 75), NO, 0.0);
        [image drawInRect:CGRectMake(0, 0, 75, 75)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
#warning В замечаниях я писал, что необходимо создать свой класс ячейки, наследник UITableViewCell, которая умела бы сама заполняться моделью данных. Заполнять ячейку в данном методе является дурным тоном, так как вы полностью обнажаете интерфейс ячейки. Также, при заполнении может потребоваться вызвать какие-то внутренние методы ячейки, которые не должны быть видны извне.
    
    cell.imageView.image = newImage;
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    NSString* nameOfPicture = [self.repository.namePictures  objectAtIndex:indexPath.row];
#warning Чтобы капитализировать строку, достаточно вызвать метод capitalizeString, который вернет капитализированую строку. Не нужно ничего мудрить с рейнджами
    NSString* changedNameOfPicture = [nameOfPicture stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                              withString:[[nameOfPicture substringToIndex:1] capitalizedString]];
    label.text = changedNameOfPicture;
    return cell;
}


@end
