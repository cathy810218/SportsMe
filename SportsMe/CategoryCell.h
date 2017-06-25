//
//  CategoryCell.h
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportsAPI.h"

@interface CategoryCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic) SMSportsType sportsType;
@end
