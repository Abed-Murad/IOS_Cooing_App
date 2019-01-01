//
//  ViewController.m
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import "ViewController.h"
#import "RecipeItemCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray *recipeArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recipeArray = @[@"Food1" , @"Food2" , @"Food3"];
    [self.collectionView reloadData];
}


//CollctionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.recipeArray.count;
}

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
@end
