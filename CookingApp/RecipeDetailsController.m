//
//  RecipeDetailsControllerViewController.m
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import "RecipeDetailsController.h"
@interface RecipeDetailsController ()
@property (weak, nonatomic) IBOutlet UICollectionView *sliderCollectionView;
@property (strong) NSTimer *timer;
@property (strong) NSMutableArray *datasource;
@end

@implementation RecipeDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *name =[self.recipe valueForKey:@"name"];
    NSString *ingredients =[self.recipe valueForKey:@"ingredients"];
    NSString *quantites =[self.recipe valueForKey:@"quantites"];
    NSString *nop =[self.recipe valueForKey:@"nop"];
    NSString *calories =[self.recipe valueForKey:@"calories"];
    NSString *tags =[self.recipe valueForKey:@"tags"];
    
    UIImage *firstImage = [UIImage imageWithData:[self.recipe valueForKey:@"first_photo"]];
    UIImage *secondImage = [UIImage imageWithData:[self.recipe valueForKey:@"second_photo"]];
    UIImage *thirdImage = [UIImage imageWithData:[self.recipe valueForKey:@"third_photo"]];
    
    self.datasource = [[NSMutableArray alloc]init];
    [self.datasource addObject:firstImage];
    [self.datasource addObject:secondImage];
    [self.datasource addObject:thirdImage];
    
    
    self.nameTextView.text = name  ;
    self.ingredientsTextView.text = ingredients ;
    self.quantitesTextView.text = quantites ;
    self.nopTextView.text = nop ;
    self.caloriesTextView.text = calories ;
    self.tagsTextView.text = tags ;
    [self.firstImageView setImage:(firstImage)];
    
    
}
- (IBAction)onPreviceCliked:(id)sender {
    if (self.datasource != nil) {
        if (self.datasource.count != 0) {
//            [self scrollToPreviousOrNextCell:@"Previous"];
        }
    }
}

- (IBAction)onNextClicked:(id)sender {
    if (self.datasource != nil) {
        if (self.datasource.count != 0) {
//            [self scrollToPreviousOrNextCell:@"Next"];
        }
    }

}




@end
