//
//  Team.h
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Team : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) UIImage *logo;

- (instancetype)initWithTeamName:(NSString *)name andCity:(NSString *)city;
@end
