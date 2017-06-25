//
//  SportsAPI.h
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SMSportsType) {
    SMSportsTypeESportLOL,
    SMSportsTypeESportDOTA,
    SMSportsTypeESportCSGL,
    SMSportsTypeNFL,
    SMSportsTypeMLB,
    SMSportsTypeNBA,
    SMSportsTypeMLS,
    SMSportsTypeNHL
};

@interface SportsAPI : NSObject 
-(void)fetchGameMatchDataWithSportType:(SMSportsType)type completion:(void (^)(NSArray *games))completion;

-(void)fetchTommorrowsGameMatchDataWithSportType:(SMSportsType)type completion:(void (^)(NSArray *games))completion;

@end
