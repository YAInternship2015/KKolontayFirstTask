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

- (void)setRepository:(PSKRepository *)repository;
- (IBAction)pressButtonSave:(id)sender;
- (IBAction)enterEnded:(id)sender;

@end
