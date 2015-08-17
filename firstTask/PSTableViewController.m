//
//  TableViewController.m
//  firstTask
//
//  Created by Konstantin Kolontay on 7/31/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSTableViewController.h"

@interface PSTableViewController ()

#warning перед открывающейся скобкой нужен пробел
@property(nonatomic, strong) PSKRepository *repository;

@end

@implementation PSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _repository = [[PSKRepository alloc]init];
#warning здесь не нужна пустая строка
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
#warning здесь не нужна пустая строка
}

#pragma mark - Namber of rows

- (NSInteger)tableView:(UITableView *)tableView
                        numberOfRowsInSection:(NSInteger)section {
#warning здесь не нужен пробел перед скобкой [
    return [_repository countOfItems ];
#warning здесь не нужна пустая строка
}

#pragma mark - Cell review
- (PSKCustomCell *)tableView:(UITableView *)tableView
                                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    [cell initWithItem:[_repository itemAtIndex:indexPath.row]];
    return cell;
#warning здесь не нужна пустая строка
}

@end
