//
//  RecipeDetailsControllerViewController.h
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/Coredata.h"

@interface RecipeDetailsController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *nameTextView;
@property (weak, nonatomic) IBOutlet UILabel *ingredientsTextView;
@property (weak, nonatomic) IBOutlet UILabel *caloriesTextView;
@property (weak, nonatomic) IBOutlet UILabel *tagsTextView;
@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;
@property (weak, nonatomic) IBOutlet UILabel *nopTextView;

@property (weak, nonatomic) IBOutlet UILabel *quantitesTextView;

@property (strong , nonatomic)NSManagedObject *recipe ;
@end
