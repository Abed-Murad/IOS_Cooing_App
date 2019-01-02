//
//  AddRecipeViewController.m
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import "AddRecipeViewController.h"

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onAddImagesBtnClicked:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //You can retrieve the actual UIImage
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    //Or you can get the image url from AssetsLibrary
    NSURL *path = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    if (imageCount < 1) {
        [self.firstImageView setImage:(image)];
        imageCount ++ ;
    }else if (imageCount < 2){
        [self.secondImageVIew setImage:(image)];
        imageCount ++ ;
    }else if (imageCount < 3){
        [self.thiredImageView setImage:(image)];
        self.AddImagesBtn.enabled = NO;
        imageCount ++ ;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}




@end
