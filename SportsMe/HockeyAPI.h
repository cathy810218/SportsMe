//
//  FootballAPI.h
//  SportsMe
//
//  Created by Elyanil Liranzo Castro on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HockeyAPI : NSObject
- (void)fetchHockeyDataWithCompletion:(void (^)(NSArray *games))completion;
- (void)fetchTommorrowsHockeyDataWithCompletion:(void (^)(NSArray *games))completion;


@end
