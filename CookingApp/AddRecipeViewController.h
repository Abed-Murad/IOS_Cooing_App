//
//  AddRecipeViewController.h
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import <UIKit/UIKit.h>
static int imageCount = 0;

@interface AddRecipeViewController : UIViewController<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageVIew;
@property (weak, nonatomic) IBOutlet UIImageView *thiredImageView;

@property (weak, nonatomic) IBOutlet UIButton *AddImagesBtn;

@property (weak, nonatomic) IBOutlet UITextField *tagsTextView;
@property (weak, nonatomic) IBOutlet UITextField *caloriesTextView;
@property (weak, nonatomic) IBOutlet UITextField *nopTextView;
@property (weak, nonatomic) IBOutlet UITextField *quantityTextView;
@property (weak, nonatomic) IBOutlet UITextField *ingradientsTextView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextView;

@end

