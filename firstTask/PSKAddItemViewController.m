//
//  PSKAddItemViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKAddItemViewController.h"

@interface PSKAddItemViewController ()

@property (nonatomic,weak) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *choosenImage;
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation PSKAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)chooseImage:(id)sender {
    _imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.delegate = self;
    [_imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

#pragma mark - set image in imageView

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
   
    _choosenImage = info[UIImagePickerControllerOriginalImage];
    [self.imageView setImage:_choosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - cansel selected image

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
