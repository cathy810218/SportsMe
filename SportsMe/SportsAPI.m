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

@property(strong, nonatomic) NSXMLParser *xmlParser;
@property(strong, nonatomic) NSString *textNode;
@property(strong, nonatomic) NSString *elementName;
@end
@implementation SportsAPI

// -(void)fetchGameMatchDataWithSportType:(SMSportsType)type completion:(void (^)(NSArray *cats))completion {
//     switch (type) {
//         case SMSportsTypeESports:
//             break;
//         case SMSportsTypeMLB:
//             [SportMLBAPI beginParsing];
//             break;
//     }
// }
 



@end
