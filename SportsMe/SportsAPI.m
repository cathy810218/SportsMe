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

@end
@implementation SportsAPI
/*
 ```-(void)fetchGameMatchDataWithSportType:(SMSportsType)type completion:(void (^)(NSArray *cats))completion {
 switch (type) {
 case SMSportsTypeESports:
 case SMSportsTypeMLB:
 }
 }```
 */



-(void)beginParsing{
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://api.sportradar.us/mlb-t5/games/2017/06/24/schedule.xml?api_key=%@", secretKey];
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    self.xmlParser = parser;
    self.xmlParser.delegate = self;
    [self.xmlParser parse];
    
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"Element Name: %@", elementName);
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
}

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
    
}


@end
