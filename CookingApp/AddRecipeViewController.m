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
    imageCount = 0;
    
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
	        imageCount ++ ;
        [self.firstImageView setImage:(image)];
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
    [newRecipe setValue:self.tagsTextView.text forKey:@"tags"];
    [newRecipe setValue:self.caloriesTextView.text forKey:@"calories"];


    [newRecipe setValue:self.quantityTextView.text forKey:@"quantites"];
    [newRecipe setValue:self.nopTextView.text forKey:@"nop"];

    
    NSLog(@"quantites:%@" ,self.quantityTextView.text);
    NSLog(@"quantites:%@" ,self.nopTextView.text);


    NSData *imageData1 = UIImagePNGRepresentation(self.firstImageView.image);
    NSData *imageData2 = UIImagePNGRepresentation(self.secondImageVIew.image);
    NSData *imageData3 = UIImagePNGRepresentation(self.thiredImageView.image);
    
    [newRecipe setValue:imageData1 forKey:@"first_photo"];
    [newRecipe setValue:imageData2 forKey:@"second_photo"];
    [newRecipe setValue:imageData3 forKey:@"third_photo"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];

    

}



@end
