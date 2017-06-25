//
//  BaseballAPI.m
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "BaseballAPI.h"
#import "APIKeys.h"
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

-(void)beginParsing{
    NSString *todaysDate = [self getTodaysDate];
    NSError *error;
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/mlb-t5/games/%@/schedule.json?api_key=%@",todaysDate, secretKey];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    
}


@end
