//
//  DotaAPI.h
//  SportsMe
//
//  Created by Brandon Little on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DotaAPI : NSObject

-(void)fetchDotaDataWithCompletion:(void (^)(NSArray *games))completion;

-(void)fetchTomorrowsDotaDataWithCompletion:(void (^)(NSArray *games))completion;

@end
