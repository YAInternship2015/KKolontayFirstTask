//
//  PSKAddItemViewController.h
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModelsDataSourceDelegate <NSObject>

- (void)dataWasChanged;

@end

@interface PSKAddItemViewController : UIViewController <
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
>

@property (nonatomic, weak) id <ModelsDataSourceDelegate> delegate;

@end
