//
//  SportsAPI.m
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "SportsAPI.h"
#import "APIKeys.h"
#import "BaseballAPI.h"
#import "SoccerAPI.h"
@interface SportsAPI()<NSXMLParserDelegate>

@end
@implementation SportsAPI

 -(void)fetchGameMatchDataWithSportType:(SMSportsType)type completion:(void (^)(NSArray *games))completion {
     switch (type) {
         case SMSportsTypeMLB:
         {
             BaseballAPI *baseball = [[BaseballAPI alloc] init];
             [baseball fetchBaseballDataWithCompletion:^(NSArray *games) {
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




@end
