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
@property (weak, nonatomic) IBOutlet UILabel *labelTextField;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (nonatomic, strong) NSString *pathPicture;
- (IBAction)pressOK:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *pressCancel;
- (IBAction)enterEnded:(id)sender;

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
    NSURL *urlFile = [info objectForKey:UIImagePickerControllerReferenceURL];
    _pathPicture = [urlFile path];
    if ([_nameField.text isEqualToString:@""]) {
        _nameField.text = [[urlFile path] lastPathComponent];
    }
    
}

#pragma mark - cansel selected image

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pressOK:(id)sender {
    [_repository.data writeItemToPlist:[_nameField text] pathImage:_pathPicture];
    [_repository load];
}
- (IBAction)enterEnded:(id)sender {
}
@end
