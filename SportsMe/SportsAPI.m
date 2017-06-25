//
//  SportsAPI.m
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "SportsAPI.h"
#import "APIKeys.h"

@interface SportsAPI()<NSXMLParserDelegate>

@end
@implementation SportsAPI

+ (NSDictionary *)sportsTypeDisplayNames
{
    return @{@(SMSportsTypeESportLOL) : @"LOL",
             @(SMSportsTypeESportDOTA) : @"DOTA",
             @(SMSportsTypeESportCSGL) : @"CSGL",
             @(SMSportsTypeNFL) : @"NFL",
             @(SMSportsTypeMLB) : @"MLB",
             @(SMSportsTypeNBA) : @"NBA",
             @(SMSportsTypeMLS) : @"MLS",
             @(SMSportsTypeNHL) : @"NHL"};
}

+ (void)fetchGameMatchDataWithSportsType:(SMSportsType)type completion:(void (^)(NSArray *games))completion {
    switch (type) {
        case SMSportsTypeMLB:
        {
            [[BaseballAPI shared] fetchBaseballDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeMLS:
        {
            SoccerAPI *soccer = [[SoccerAPI alloc]init];
            [soccer fetchSoccerDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeESportDOTA:
        {
            DotaAPI *dota = [[DotaAPI alloc] init];
            [dota fetchDotaDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeESportLOL:
        {
            LeagueOfLegendsAPI *lol = [[LeagueOfLegendsAPI alloc] init];
            [lol fetchLoLDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeESportCSGL:
        {
            CounterStrikeAPI *csgo = [[CounterStrikeAPI alloc] init];
            [csgo fetchCSGODataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
        }
        case SMSportsTypeNBA:
        {
            BasketballAPI *basketball = [[BasketballAPI alloc] init];
            [basketball fetchBasketballDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeNFL:
        {
            
        }
        case SMSportsTypeNHL:
        {
            HockeyAPI *hockey = [[HockeyAPI alloc] init];
            [hockey fetchHockeyDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
            
    }
}


+ (void)fetchAllTeamsWithSportsType:(SMSportsType)type completion:(void (^)(NSArray *teams))completion {
    switch (type) {
        case SMSportsTypeMLB:
        {
            completion([BaseballAPI shared].teams);
            break;
        }
        case SMSportsTypeMLS:
        {
            break;
        }
        case SMSportsTypeESportDOTA:
        {
            
        }
        case SMSportsTypeESportLOL:
        {
            
        }
        case SMSportsTypeESportCSGL:
        {
            
        }
        case SMSportsTypeNBA:
        {
            
        }
        case SMSportsTypeNFL:
        {
            
        }
    }
}


+ (void)fetchTommorrowsGameMatchDataWithSportsType:(SMSportsType)type completion:(void (^)(NSArray *games))completion {    switch (type) {
        case SMSportsTypeMLB:
        {
            BaseballAPI *baseball = [[BaseballAPI alloc] init];
            [baseball fetchTomorrowsBaseballDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeMLS:
        {
            SoccerAPI *soccer = [[SoccerAPI alloc] init];
            [soccer fetchTomorrowsSoccerDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeNFL:
        {
            break;
        }
        case SMSportsTypeNHL:
        {
            HockeyAPI *hockey = [[HockeyAPI alloc] init];
            [hockey fetchTommorrowsHockeyDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeNBA:
        {
            BasketballAPI *basketball = [[BasketballAPI alloc] init];
            [basketball fetchTomorrowsBasketballDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeESportDOTA:
        {
            DotaAPI *dota = [[DotaAPI alloc] init];
            [dota fetchTomorrowsDotaDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeESportLOL:
        {
            LeagueOfLegendsAPI *lol = [[LeagueOfLegendsAPI alloc] init];
            [lol fetchTomorrowsLoLDataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
        case SMSportsTypeESportCSGL:
        {
            CounterStrikeAPI *csgo = [[CounterStrikeAPI alloc] init];
            [csgo fetchTomorrowsCSGODataWithCompletion:^(NSArray *games) {
                completion(games);
            }];
            break;
        }
    }
}




@end
