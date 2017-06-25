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
@interface SportsAPI()<NSXMLParserDelegate>

@property(strong, nonatomic) NSXMLParser *xmlParser;
@property(strong, nonatomic) NSString *textNode;
@property(strong, nonatomic) NSString *elementName;
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
