//
//  CategoriesViewController.h
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportsAPI.h"

@protocol CategoryViewControllerDelegate <NSObject>
- (void)didSelectSportsType:(SMSportsType)type;
@end

@interface CategoriesViewController : UIViewController
@property (weak, nonatomic) id<CategoryViewControllerDelegate> delegate;
@end
