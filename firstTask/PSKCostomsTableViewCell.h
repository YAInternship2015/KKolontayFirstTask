//
//  PSKCostomsTableViewCell.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/9/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSKRepository.h"

@interface PSKCostomsTableViewCell : UITableViewCell 

@property (weak, nonatomic) IBOutlet UIImageView *imagePictur;
@property (weak, nonatomic) IBOutlet UILabel *namePicture;

- (void)addElements:(NSInteger)index;

@end
