//
//  BaseballAPI.m
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "BaseballAPI.h"
#import "APIKeys.h"
@interface BaseballAPI() <NSXMLParserDelegate>
@property(strong, nonatomic) NSXMLParser *xmlParser;
@property(strong, nonatomic) NSString *textNode;
@property(strong, nonatomic) NSString *elementName;
@end

@implementation BaseballAPI

-(void)beginParsing{
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.sportradar.us/mlb-t5/games/2017/06/24/schedule.xml?api_key=%@", secretKey];
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    self.textNode = [[NSString alloc] init];
    self.elementName = [[NSString alloc]init];
    NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    self.xmlParser = parser;
    self.xmlParser.delegate = self;
    [self.xmlParser parse];
    
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    self.elementName = elementName;
    if([elementName  isEqual: @"game"]){
        NSLog(@"Statuses: %@", attributeDict[@"status"]);
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
}

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
    
}

@end
