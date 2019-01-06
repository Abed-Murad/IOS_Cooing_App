//
//  ViewController.h
//  CookingApp
//
//  Created by Abed on 1/1/19.
//  Copyright © 2019 AM Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/Coredata.h"
@interface ViewController : UIViewController<UISearchBarDelegate, UISearchDisplayDelegate ,UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addReicpeBtn;
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property NSManagedObject *selectedRecipe  ;

@end

