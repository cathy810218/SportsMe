//
//  SoccerAPI.m
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "SoccerAPI.h"
#import "APIKeys.h"
#import "Game.h"
@interface SoccerAPI()
@property(strong, nonatomic) NSDateFormatter *dateFormatter;

@end


@implementation SoccerAPI
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

- (void)fetchSoccerDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/soccer-t3/am/en/schedules/%@/schedule.json?api_key=%@",todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSMutableArray *games = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in json[@"sport_events"]) {
        Game *game = [[Game alloc]initWithSoccerGame:dict];
        [games addObject:game];
    }
    
    completion(games);
}

- (void)fetchTomorrowsSoccerDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *tomorrowsDate = [self getTomorrowsDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/soccer-t3/am/en/schedules/%@/schedule.json?api_key=%@",tomorrowsDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSMutableArray *games = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in json[@"sport_events"]) {
        Game *game = [[Game alloc]initWithSoccerGame:dict];
        [games addObject:game];
    }
    
    completion(games);
}

@end
