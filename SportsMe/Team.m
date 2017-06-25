//
//  Team.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "Team.h"

@implementation Team

- (instancetype)initWithObject:(NSDictionary *)jsonObject {
    self = [super init];
    if (self) {
        self.name = jsonObject[@"name"];
        self.location = jsonObject[@"location"];
    }
    return self;
}

@end
