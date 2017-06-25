//
//  Game.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "Game.h"


@implementation Game

- (instancetype)initWithNFLGame:(NSDictionary *)object {
    self = [super init];
    if (self) {
//        object[] = self.homeTeam;
//        object[] = self.awayTeam;
        
    }
    return self;
}

- (instancetype)initWithMLBGame:(NSDictionary *)object{
    self = [super init];
    if (self){
        self.homeTeam = [[Team alloc] initWithTeamName:object[@"home"][@"name"] andCity:object[@"home"][@"market"]];
        self.awayTeam = [[Team alloc] initWithTeamName:object[@"away"][@"name"] andCity:object[@"away"][@"market"]];
        self.gameDate = object[@"scheduled"];
        self.channel = object[@"broadcast"][@"network"];
        
    }
    return self;
}

- (instancetype)initWithLoLGame:(NSDictionary *)object{
    self = [super init];
    if (self){
        self.homeTeam = [[Team alloc] initWithTeamName:object[@"competitors"][0][@"name"] andCity:object[@"competitors"][0][@"country"]];
        self.awayTeam = [[Team alloc] initWithTeamName:object[@"competitors"][1][@"name"] andCity:object[@"competitors"][1][@"country"]];
        self.gameDate = object[@"scheduled"];
    }

    return self;
}

- (instancetype)initWithSoccerGame:(NSDictionary *)object{
    self = [super init];
    if (self){
//        self.homeTeam = [[Team alloc] initWithTeamName:object[@""] andCity:<#(NSString *)#>]
        self.homeTeam = [[Team alloc] initWithTeamName:object[@"competitors"][0][@"name"] andCity:object[@"competitors"][0][@"country"]];
        self.awayTeam = [[Team alloc] initWithTeamName:object[@"competitors"][1][@"name"] andCity:object[@"competitors"][1][@"country"]];
        self.gameDate = object[@"scheduled"];
    }

    return self;
}

@end
