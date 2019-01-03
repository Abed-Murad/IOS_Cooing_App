//
//  AddRecipeViewController.m
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "CoreData/Coredata.h"

@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

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

- (IBAction)onCreateBtnClicked:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newRecipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:context];
    [newRecipe setValue:self.nameTextView.text forKey:@"name"];
    [newRecipe setValue:self.ingradientsTextView.text forKey:@"ingredients"];
    [newRecipe setValue:self.quantityTextView.text forKey:@"quantites"];
    [newRecipe setValue:self.nopTextView.text forKey:@"nop"];
    [newRecipe setValue:self.caloriesTextView.text forKey:@"calories"];
    [newRecipe setValue:@"firstImage" forKey:@"tags"];
    [newRecipe setValue:@"secondImage"forKey:@"first_photo"];
    [newRecipe setValue:@"thirdImage" forKey:@"second_photo"];
    
//    [newRecipe setValue:self.thiredImageView.image forKey:@"third_photo"];
//    [newRecipe setValue:self.firstImageView.image forKey:@"first_photo"];
//    [newRecipe setValue:self.secondImageVIew.image forKey:@"second_photo"];
//    [newRecipe setValue:self.thiredImageView.image forKey:@"third_photo"];
    
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    

}



@end
