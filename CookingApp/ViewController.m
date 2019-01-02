//
//  ViewController.m
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import "ViewController.h"
#import "RecipeItemCell.h"
#import "AddRecipeViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *recipeArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    //CoolectionView Start
    self.collectionView.delegate = self ;
    self.recipeArray = @[@"Food1" , @"Food2" , @"Food3"];
    [self.collectionView reloadData];
    //CollectionView End
}


/*CollectionView DataSource and Delegate Protocals Methods Start*/

// Collection View Size Based on the Array Size
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.recipeArray.count;
}

//OnCollectionView Item Create
- (__kindof UICollectionViewCell *) collectionView:(UICollectionView *)
   collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
    static NSString *cellIdentifer = @"RecipeCell";
    RecipeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifer forIndexPath:indexPath];
    
    //get The Recipe Name
    NSString *recipeName = [self.recipeArray objectAtIndex:indexPath.row];
    //Populate the Cell
    cell.recipeitemLabel.text = recipeName ;
    cell.backgroundColor = [UIColor redColor];
    //retrun the cell
    return cell;
}
//On CollectionView Item Click Listener
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //Get The Recipe Name
    NSString *selectedRecipe = [self.recipeArray objectAtIndex:indexPath.row];
    NSLog(@"Selected:%@" ,selectedRecipe);
    
    
}
/*CollectionView DataSource and Delegate Protocals Methods End*/

- (IBAction)onAddClcik:(id)sender {
    //Open The New Layout
    AddRecipeViewController *addRecipeController = [self.storyboard instantiateViewControllerWithIdentifier:@"addRecipeId"];
    
    [self.navigationController pushViewController:addRecipeController animated:YES];
}


@end
