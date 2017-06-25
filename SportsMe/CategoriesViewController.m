//
//  CategoriesViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoryCell.h"

@interface CategoriesViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"CategoryCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"CategoryCell"];
}


#pragma UICollectionViewControllerDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Do a network call base on what user selects
}


@end
