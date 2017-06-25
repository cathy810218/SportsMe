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
        self.homeTeam = [[Team alloc] initWithTeamName:object[@"competitors"][0][@"name"] andCity:object[@"competitors"][0][@"country"]];
        self.awayTeam = [[Team alloc] initWithTeamName:object[@"competitors"][1][@"name"] andCity:object[@"competitors"][1][@"country"]];
        self.gameDate = object[@"scheduled"];
    }

    return self;
}

- (instancetype)initWithNBAGame:(NSDictionary *)object{
    self = [super init];
    if (self) {
        NSString *awayTeamName = [[object[@"away"][@"name"] componentsSeparatedByString:@" "] firstObject];
        NSString *awayTeamCity = [[object[@"away"][@"name"] componentsSeparatedByString:@" "] lastObject];
        NSString *homeTeamName = [[object[@"home"][@"name"] componentsSeparatedByString:@" "] firstObject];
        self.homeTeam = [[Team alloc]initWithTeamName:homeTeamName andCity:object[@"venue"][@"city"]];
        self.awayTeam = [[Team alloc] initWithTeamName:awayTeamName andCity:awayTeamCity];
        
        self.gameDate = object[@"scheduled"];
        
        self.channel = object[@"broadcast"][@"network"];
    }
    
    return self;
}

-(instancetype)initWithNHLGame:(NSDictionary *)object{
    self = [super init];
    if (self){
        NSString *homeTeamCity = [[object[@"home"][@"name"] componentsSeparatedByString:@" "] firstObject];
        NSMutableArray *homeTeamName = [[object[@"home"][@"name"] componentsSeparatedByString:@" "] mutableCopy];
        [homeTeamName removeObjectAtIndex:0];
        NSString *awayTeamCity = [[object[@"away"][@"name"] componentsSeparatedByString:@" "] firstObject];
        NSMutableArray *awayTeamName = [[object[@"away"][@"name"] componentsSeparatedByString:@" "] mutableCopy];
        [awayTeamName removeObjectAtIndex:0];
        self.homeTeam = [[Team alloc] initWithTeamName:[homeTeamName componentsJoinedByString:@" "] andCity:homeTeamCity];
        self.awayTeam = [[Team alloc] initWithTeamName:[awayTeamName componentsJoinedByString:@" "] andCity:awayTeamCity];
        self.gameDate = object[@"scheduled"];
        self.channel = object[@"broadcast"][@"network"];
    }
    
    return self;
}

- (NSString *)getTodaysDate{
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [self.dateFormatter stringFromDate:[NSDate date]];
}

@end
