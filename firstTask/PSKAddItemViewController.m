//
//  PSKAddItemViewController.m
//  PictureStorage
//
//  Created by Konstantin Kolontay on 8/19/15.
//  Copyright (c) 2015 Konstantin Kolontay. All rights reserved.
//

#import "PSKAddItemViewController.h"
#import "PSKValidator.h"
#import "MagicalRecord/MagicalRecord.h"
//#import <CoreData/CoreData.h>
#import "ItemsOfPicture.h"

@interface PSKAddItemViewController ()

@property (nonatomic, strong) NSString *pathPicture;
@property (nonatomic, strong) UIImage *choosenImage;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *buttonSave;
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
- (IBAction)pressButtonSave:(id)sender;
- (IBAction)enterEnded:(id)sender;

@end

@implementation PSKAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

#pragma mark - choose image with UIImagePickerController

- (IBAction)chooseImage:(id)sender {
    _imagePicker = [[UIImagePickerController alloc]init];
    _imagePicker.delegate = self;
    [_imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:_imagePicker animated:YES completion:nil];
    [_buttonSave setEnabled:YES];
}

#pragma mark - set image in imageView

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    _choosenImage = info[UIImagePickerControllerOriginalImage];
    [self.imageView setImage:_choosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSURL *urlFile = [info objectForKey:UIImagePickerControllerReferenceURL];
    _pathPicture = [urlFile absoluteString];
    if ([_nameField.text isEqualToString:@""]) {
        _nameField.text = [[urlFile path] lastPathComponent];
    }
}

#pragma mark - cansel selected image

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - press button OK

- (IBAction)pressButtonSave:(id)sender {
    NSError *error;
    /*if ([PSKValidator isValidModelTitle:_nameField.text error:&error] && _pathPicture != nil) {
        PSKDataController *addItemToFile = [[PSKDataController alloc]init];
        [addItemToFile readItemsFromPlist];
        [addItemToFile writeItemToPlist:[_nameField text] pathImage:_pathPicture];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DataFileContentDidChange" object:self];
        [self.delegate dataWasChanged];
        [_buttonSave setEnabled:NO];
    }
    else {
        [[[UIAlertView alloc]initWithTitle:error.localizedDescription message:error.localizedRecoverySuggestion delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil]show];
    }*/
    if ([PSKValidator isValidModelTitle:_nameField.text error:&error] && _pathPicture != nil) {
        ItemsOfPicture *item = [ItemsOfPicture MR_createEntity];
        item.pathPicture = _pathPicture;
        item.namePicture = _nameField.text;
        [[NSManagedObjectContext MR_defaultContext]MR_saveOnlySelfAndWait];
        [_buttonSave setEnabled:NO];
    }
    else {
        [[[UIAlertView alloc]initWithTitle:error.localizedDescription message:error.localizedRecoverySuggestion delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil]show];
    }
}

#pragma mark - press button Cancel

- (IBAction)enterEnded:(id)sender {
}

@end
