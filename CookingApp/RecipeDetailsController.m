//
//  RecipeDetailsControllerViewController.m
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import "RecipeDetailsController.h"

@interface RecipeDetailsController ()

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
    
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
