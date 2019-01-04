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
#import "RecipeDetailsController.h"
#import "CoreData/Coredata.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong) NSMutableArray * myObjects;

@end

@implementation ViewController

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
    self.myObjects = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    //CoolectionView Start
    self.collectionView.delegate = self ;
    [self.collectionView reloadData];
    //CollectionView End
}


/*CollectionView DataSource and Delegate Protocals Methods Start*/

// Collection View Size Based on the Array Size
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.myObjects.count;
}

//OnCollectionView Item Create
- (__kindof UICollectionViewCell *) collectionView:(UICollectionView *)
   collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
    static NSString *cellIdentifer = @"RecipeCell";
    RecipeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifer forIndexPath:indexPath];
    
    //get The Recipe Name
    NSManagedObject *device = [self.myObjects objectAtIndex:indexPath.row];
    NSString *recipeName =[device valueForKey:@"name"];
    
    UIImage *image = [UIImage imageWithData:[device valueForKey:@"first_photo"]];
    
    //Populate the Cell
    cell.recipeitemLabel.text = recipeName ;
    cell.recipeImage.image = image;
    cell.backgroundColor = [UIColor redColor];
    //retrun the cell
    return cell;
}
//On CollectionView Item    Click Listener
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //Get The Recipe Name
//    NSString *selectedRecipe = [self.myObjects objectAtIndex:indexPath.row];
//    NSLog(@"Selected:%@" ,selectedRecipe);
    
    RecipeDetailsController *recipeDetailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"RecipeDetailsId"];
    self.selectedRecipe = [self.myObjects objectAtIndex:indexPath.row];
    recipeDetailsController.recipe = self.selectedRecipe;
    [self.navigationController pushViewController:recipeDetailsController animated:YES];
    
    
}
/*CollectionView DataSource and Delegate Protocals Methods End*/

- (IBAction)onAddClcik:(id)sender {
    //Open The New Layout
    AddRecipeViewController *addRecipeController = [self.storyboard instantiateViewControllerWithIdentifier:@"addRecipeId"];
    
    [self.navigationController pushViewController:addRecipeController animated:YES];
}



@end
