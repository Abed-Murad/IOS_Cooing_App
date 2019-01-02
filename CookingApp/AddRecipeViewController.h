//
//  AddRecipeViewController.h
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import <UIKit/UIKit.h>
static int imageCount = 1;

@interface AddRecipeViewController : UIViewController<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageVIew;
@property (weak, nonatomic) IBOutlet UIImageView *thiredImageView;
@property (weak, nonatomic) IBOutlet UIButton *AddImagesBtn;

@end

