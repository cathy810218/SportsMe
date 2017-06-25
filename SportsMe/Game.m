//
//  Game.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "Game.h"

@interface Game()
@property(strong, nonatomic) NSDateFormatter *dateFormatter;

@end

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
        self.gameDate = [self formatDateWithDateString:object[@"scheduled"]];
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

- (NSDate *)formatDateWithDateString:(NSString *)dateStr{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // set the date format related to what the string you have
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    // again add the date format what the output u need
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];

    NSString *finalDate = [dateFormat stringFromDate:date];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *mydate = [dateFormat dateFromString:finalDate];
    return mydate;
}


@end
