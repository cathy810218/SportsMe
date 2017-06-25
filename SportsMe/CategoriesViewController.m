//
//  CategoriesViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoryCell.h"
#import "BaseballAPI.h"

@interface CategoriesViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *buttonImages;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"CategoryCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"CategoryCell"];
    
    self.buttonImages = @[@"mlb", @"mls", @"esports", @"nba", @"nfl"];
}


#pragma UICollectionViewControllerDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    UIImage *img = [UIImage imageNamed:self.buttonImages[indexPath.row]];
    cell.imageView.image = img;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            
            break;
        }
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        case 3:
        {
            break;
        }
        case 4:
        {
            break;
        }
    }

}


@end
