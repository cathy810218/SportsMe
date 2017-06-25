//
//  BaseballAPI.m
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "BaseballAPI.h"
#import "APIKeys.h"
#import "Game.h"
@interface BaseballAPI()
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSMutableDictionary *teamDictionary;
@end

@implementation BaseballAPI

+ (instancetype)shared {
    static BaseballAPI *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
        shared.teamDictionary = [[NSMutableDictionary alloc] init];
        shared.teams = [[NSMutableArray alloc] init];
        [shared fetchAllTeamsDataWithComletion:^(NSArray *AmericanLeagueTeams, NSArray *NationalLeagueTeams) {
            shared.teams = [AmericanLeagueTeams arrayByAddingObjectsFromArray:NationalLeagueTeams];
//            [[NSUserDefaults standardUserDefaults] setObject:shared.teams forKey:@"kMLBTeams"];
        }];
    });
    return shared;
}


- (NSString *)getTodaysDate{
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [self.dateFormatter stringFromDate:[NSDate date]];
}

- (NSString *)getTomorrowsDate{
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [self.dateFormatter stringFromDate:nextDate];
}

- (void)fetchBaseballDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/mlb-t5/games/%@/schedule.json?api_key=%@",todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *games = json[@"league"][@"games"];
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithMLBGame:dict];
        NSString *homeKey = dict[@"home"][@"name"];
        NSString *awayKey = dict[@"away"][@"name"];
        game.homeTeam = self.teamDictionary[homeKey];
        game.awayTeam = self.teamDictionary[awayKey];
        
        [gameObjects addObject:game];
    }
    completion(gameObjects);
}

- (void)fetchTomorrowsBaseballDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *tomorrowsDate = [self getTomorrowsDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/mlb-t5/games/%@/schedule.json?api_key=%@",tomorrowsDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *games = json[@"league"][@"games"];
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithMLBGame:dict];
        [gameObjects addObject:game];
    }
    completion(gameObjects);
}

- (void)fetchAllTeamsDataWithComletion:(void (^)(NSArray *AmericanLeagueTeams, NSArray *NationalLeagueTeams))completion {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MLBTeams" ofType:@"json"];
    NSURL *localFileURL = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:localFileURL];
    
    NSError *error;
//    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/mlb-t6/league/hierarchy.json?api_key=%@", secretKey];
//    NSURL *url = [[NSURL alloc] initWithString:urlString];
//    NSData *data = [NSData dataWithContentsOfURL:url];
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
