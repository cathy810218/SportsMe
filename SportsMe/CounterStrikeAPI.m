//
//  CounterStrikeAPI.m
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "CounterStrikeAPI.h"
#import "APIKeys.h"
#import "Game.h"

@interface CounterStrikeAPI()

@property(strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation CounterStrikeAPI

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

-(void)fetchCSGODataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/csgo-t1/en/schedules/%@/schedule.json?api_key=%@",todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", json);
    NSArray *games = json[@"sport_events"];
    NSLog(@"Games: %@", games);
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithLoLGame:dict];
        [gameObjects addObject:game];
    }
    completion(gameObjects);
    
}

-(void)fetchTomorrowsCSGODataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *tomorrowsDate = [self getTomorrowsDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/csgo-t1/en/schedules/%@/schedule.json?api_key=%@",tomorrowsDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", json);
    NSArray *games = json[@"sport_events"];
    NSLog(@"Games: %@", games);
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithLoLGame:dict];
        [gameObjects addObject:game];
    }
    completion(gameObjects);
    
}

@end
