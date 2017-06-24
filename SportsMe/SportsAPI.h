//
//  SportsAPI.h
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SMSportsType) {
    SMSportsTypeESport,
    SMSportsTypeNFL,
    SMSportsTypeMLB,
    SMSportsTypeNBA,
    SMSportsTypeMLS
};

@interface SportsAPI : NSObject

@end
