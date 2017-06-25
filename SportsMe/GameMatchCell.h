//
//  GameMatchCell.h
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameMatchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *homeTeamImageView;

@property (weak, nonatomic) IBOutlet UIImageView *awayTeamImageView;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scheduledTimeLabel;

@end
