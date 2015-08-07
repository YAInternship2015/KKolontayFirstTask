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
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(75, 75), NO, 0.0);
        [image drawInRect:CGRectMake(0, 0, 75, 75)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    cell.imageView.image = newImage;
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    NSString* nameOfPicture = [self.repository.namePictures  objectAtIndex:indexPath.row];
    NSString* changedNameOfPicture = [nameOfPicture stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                              withString:[[nameOfPicture substringToIndex:1] capitalizedString]];
    label.text = changedNameOfPicture;
    return cell;
}


@end
