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

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.city = [aDecoder decodeObjectForKey:@"city"];
        self.logo = [aDecoder decodeObjectForKey:@"logo"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.logo forKey:@"logo"];
}



@end
