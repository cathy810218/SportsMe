//
//  BaseballAPI.m
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "BaseballAPI.h"
#import "APIKeys.h"
#import "Game.h"
@interface BaseballAPI()
@property(strong, nonatomic) NSString *textNode;
@property(strong, nonatomic) NSString *elementName;
@property(strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation BaseballAPI

-(NSString *)getTodaysDate{
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [self.dateFormatter stringFromDate:[NSDate date]];
}

-(void)fetchBaseballDataWithCompletion:(void (^)(NSArray *games))completion{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/mlb-t5/games/%@/schedule.json?api_key=%@",todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSArray *games = json[@"league"][@"games"];
    NSLog(@"Games: %@", games);
    NSMutableArray *gameObjects = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in games) {
        Game *game = [[Game alloc]initWithMLBGame:dict];
        [gameObjects addObject:game];
    }
    completion(gameObjects);
    
}


@end
