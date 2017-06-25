//
//  Team.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "Team.h"

@implementation Team

- (instancetype)initWithTeamName:(NSString *)name andCity:(NSString *)city{
    self = [super init];
    if (self) {
        self.name = name;
        self.city = city;
        //TODO: need to add logoURL/logoImg here
    }
    return self;
}

@end
