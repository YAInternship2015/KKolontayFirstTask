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
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView
                        numberOfRowsInSection:(NSInteger)section {

    return [[PSKRepository sharedInstance] getCount];
}

#pragma mark - Cell review

- (UITableViewCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSKCostomsTalbleViewCell"];
    if (cell == nil) {
       cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"PSKCostomsTalbleViewCell"];
    }
   // [(PSKCostomsTableViewCell *)cell addElements:[indexPath row]];
    /*
    UIImage *image = [[repository getCellImage:indexPath.row] getImage];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(75, 75), NO, 0.0);
        [image drawInRect:CGRectMake(0, 0, 75, 75)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
   
    UIImageView * imageViewCell = (UIImageView *)[cell viewWithTag:2];
    imageViewCell.image = [[repository getCellImage:indexPath.row] getImage];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    NSString* nameOfPicture = [[[repository getCellImage:indexPath.row] getName] capitalizedString] ;
    label.text = nameOfPicture;*/
    
    return cell;
}


@end