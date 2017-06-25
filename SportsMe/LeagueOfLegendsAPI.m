//
//  LeagueOfLegendsAPI.m
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "LeagueOfLegendsAPI.h"
#import "APIKeys.h"
#import "Game.h"

@interface LeagueOfLegendsAPI()

@property(strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSMutableDictionary *teamDictionary;


@end
@implementation LeagueOfLegendsAPI

-(NSString *)getTodaysDate{
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [self.dateFormatter stringFromDate:[NSDate date]];
}

-(NSString *)getTomorrowsDate{
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [self.dateFormatter stringFromDate:nextDate];
}

-(void)fetchLoLDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/lol-t1/en/schedules/%@/schedule.json?api_key=%@",todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", json);
    NSArray *games = json[@"sport_events"];
    NSLog(@"Games: %@", games);
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithLoLGame:dict];
        [gameObjects addObject:game];
    }
    completion(gameObjects);
    
}

-(void)fetchTomorrowsLoLDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *tomorrowsDate = [self getTomorrowsDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/lol-t1/en/schedules/%@/schedule.json?api_key=%@",tomorrowsDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", json);
    NSArray *games = json[@"sport_events"];
    NSLog(@"Games: %@", games);
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithLoLGame:dict];
        [gameObjects addObject:game];
    }
    completion(gameObjects);
    
}

- (void)fetchAllTeamsDataWithComletion:(void (^)(NSArray *AmericanLeagueTeams, NSArray *NationalLeagueTeams))completion {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LOLTeams" ofType:@"json"];
    NSURL *localFileURL = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:localFileURL];
    
    NSError *error;
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSMutableArray *alTeamArray = [[NSMutableArray alloc]init];
    NSArray *divisions = json[@"leagues"][0][@"divisions"];
    for (NSDictionary *obj in divisions) {
        for (NSDictionary *alteam in obj[@"teams"]) {
            NSString *name = alteam[@"name"];
            NSString *market = alteam[@"market"];
            Team *team = [[Team alloc] initWithTeamName:name andCity:market];
            team.logo = [UIImage imageNamed:[NSString stringWithFormat:@"%@ %@", market, name]];
            [alTeamArray addObject:team];
            self.teamDictionary[name] = team;
        }
    }
    
    NSMutableArray *nlTeamArray = [[NSMutableArray alloc]init];
    NSArray *divisions2 = json[@"leagues"][1][@"divisions"];
    for (NSDictionary *obj in divisions2) {
        for (NSDictionary *nlteam in obj[@"teams"]) {
            NSString *name = nlteam[@"name"];
            NSString *market = nlteam[@"market"];
            Team *team = [[Team alloc] initWithTeamName:name andCity:market];
            team.logo = [UIImage imageNamed:[NSString stringWithFormat:@"%@ %@", market, name]];
            [nlTeamArray addObject:team];
            self.teamDictionary[name] = team;
        }
    }
    completion(alTeamArray, nlTeamArray);
}

@end
