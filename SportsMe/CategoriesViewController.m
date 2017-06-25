//
//  CategoriesViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoryCell.h"
#import "TeamsViewController.h"

@interface CategoriesViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *buttonImages;
@property (strong, nonatomic) NSArray *types;
@property (weak, nonatomic) IBOutlet UIView *esportsView;
@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupEsportsView];
    self.esportsView.hidden = YES;

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.allowsSelection = YES;
    UINib *nib = [UINib nibWithNibName:@"CategoryCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"CategoryCell"];
    
    self.buttonImages = @[@"mlb", @"mls", @"esports", @"nba", @"nfl"];
    self.types = @[@0, @1, @2, @5, @6];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToHideEsportsView)];
}

- (void)tapToHideEsportsView {
    
}

- (void)setupEsportsView {
    self.esportsView.layer.cornerRadius = 5.0;
    self.esportsView.layer.masksToBounds = YES;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    [super prepareForSegue:segue sender:sender];
    NSIndexPath *indexPath = sender;
    if ([segue.identifier isEqualToString:@"TeamsViewController"]) {
        TeamsViewController *teamsVC = segue.destinationViewController;
        teamsVC.sportsType = indexPath.row;
    }
}

#pragma UICollectionViewControllerDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    UIImage *img = [UIImage imageNamed:self.buttonImages[indexPath.row]];
    cell.imageView.image = img;
    cell.sportsType = [self.types[indexPath.row] unsignedIntegerValue];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *currentCell = (CategoryCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (currentCell.sportsType == 2) {
        // Esport
        NSLog(@"Esports");
        self.esportsView.hidden = NO;
    } else {
        self.esportsView.hidden = YES;
        [self performSegueWithIdentifier:@"TeamsViewController" sender:indexPath];
    }
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width - 60;
    return CGSizeMake(screenWidth/2.0, screenWidth/2.0);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    collectionViewLayout.minimumInteritemSpacing = 20;
    collectionViewLayout.minimumLineSpacing = 20;
    return UIEdgeInsetsMake(20, 20, 20, 20);
}


@end
