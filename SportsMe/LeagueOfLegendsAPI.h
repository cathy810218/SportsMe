//
//  LeagueOfLegendsAPI.h
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeagueOfLegendsAPI : NSObject

-(void)fetchLoLDataWithCompletion:(void (^)(NSArray *games))completion;

-(void)fetchTomorrowsLoLDataWithCompletion:(void (^)(NSArray *games))completion;

- (void)fetchAllTeamsDataWithComletion:(void (^)(NSArray *AmericanLeagueTeams, NSArray *NationalLeagueTeams))completion;
@end
