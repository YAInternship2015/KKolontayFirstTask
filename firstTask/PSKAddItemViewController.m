//
//  PSKAddItemViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKAddItemViewController.h"

@interface PSKAddItemViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *choosenImage;
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end

@implementation PSKAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
