//
//  Game.h
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"

@interface Game : NSObject

@property (strong, nonatomic) Team *homeTeam;
@property (strong, nonatomic) Team *awayTeam;
@property (strong, nonatomic) NSString *gameDate;
@property (strong, nonatomic)  NSString * _Nullable channel;

- (instancetype)initWithNFLGame:(NSDictionary *)object;

- (instancetype)initWithMLBGame:(NSDictionary *)object;

- (instancetype)initWithLoLGame:(NSDictionary *)object;

- (instancetype)initWithSoccerGame:(NSDictionary *)object;

@end
