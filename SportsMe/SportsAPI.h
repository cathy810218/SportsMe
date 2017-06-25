//
//  SportsAPI.h
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseballAPI.h"
#import "SoccerAPI.h"
#import "BasketballAPI.h"
#import "HockeyAPI.h"
#import "DotaAPI.h"
#import "LeagueOfLegendsAPI.h"
#import "CounterStrikeAPI.h"

typedef NS_ENUM(NSUInteger, SMSportsType) {
    SMSportsTypeMLB,
    SMSportsTypeMLS,
    SMSportsTypeESportLOL,
    SMSportsTypeESportDOTA,
    SMSportsTypeESportCSGL,
    SMSportsTypeNBA,
    SMSportsTypeNFL,
    SMSportsTypeNHL
};

@interface SportsAPI : NSObject

+ (NSString *)sportsTypeDisplayNames:(SMSportsType)type;

+ (void)fetchGameMatchDataWithSportsType:(SMSportsType)type completion:(void (^)(NSArray *games))completion;

+ (void)fetchTommorrowsGameMatchDataWithSportsType:(SMSportsType)type completion:(void (^)(NSArray *games))completion;

+ (void)fetchAllTeamsWithSportsType:(SMSportsType)type completion:(void (^)(NSArray *teams))completion;

@end
