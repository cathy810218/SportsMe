//
//  Team.h
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;

- (instancetype)initWithTeamName:(NSString *)name andCity:(NSString *)city;
@end
