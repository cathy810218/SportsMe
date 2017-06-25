//
//  MainViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "MainViewController.h"
#import "GameMatchCell.h"
#import "CategoriesViewController.h"
#import "Game.h"
#import "Team.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray *todayGames;
@property (strong, nonatomic) NSArray *tomorrowGames;
@property (strong, nonatomic) NSArray *favoriteGames;
@property (strong, nonatomic) NSArray *displayGames;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImageView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Set up table view
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"GameMatchCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"GameMatchCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    // Set up right bar button item
    UIBarButtonItem *btn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"square"] style:UIBarButtonItemStylePlain target:self action:@selector(categoryButtonPressed:)];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.activityIndicator.hidden = YES;
    [self getTodaysGames];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getTodaysGames];
    [self checkIfDisplayGamesDataExist];
    [self.tableView reloadData];
}

- (void)checkIfDisplayGamesDataExist {
    if (self.displayGames.count == 0) {
        self.placeholderImageView.hidden = NO;
    } else {
        self.placeholderImageView.hidden = YES;
    }
}


- (void)getTodaysGames {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"kGames"];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSMutableArray *array = [NSMutableArray new];

    for (NSString *key in [dict allKeys]) {
        [SportsAPI fetchGameMatchDataWithSportsType:[key intValue] completion:^(NSArray *games) {
            [array addObjectsFromArray:games];
            self.displayGames = games;
        }];
    }
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"gameDate"
                                        ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:dateDescriptor];
    self.displayGames = [array sortedArrayUsingDescriptors:sortDescriptors];
}



- (void)getTomorrowsGames {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"kGames"];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSMutableArray *array = [NSMutableArray new];
    
    for (NSString *key in [dict allKeys]) {
        [SportsAPI fetchTommorrowsGameMatchDataWithSportsType:[key intValue] completion:^(NSArray *games) {
            [array addObjectsFromArray:games];
            self.displayGames = games;
        }];
    }
    self.displayGames = array;
}



- (void)categoryButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"CategoriesViewController" sender:sender];
}

- (IBAction)segmentControlAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"0");
            [self getTodaysGames];
            [self.tableView reloadData];
            break;
        case 1:
            NSLog(@"1");
            [self getTomorrowsGames];
            [self.tableView reloadData];
            break;
        case 2:
            NSLog(@"2");
            self.displayGames = self.favoriteGames;
            [self.tableView reloadData];
            break;
        default:
            break;
    }
}

#pragma UITableViewControllerDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayGames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GameMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameMatchCell" forIndexPath:indexPath];
    Game *game = self.displayGames[indexPath.row];
    cell.homeTeamImageView.image = game.homeTeam.logo;
    cell.awayTeamImageView.image = game.awayTeam.logo;
    cell.homeTeamNameLabel.text = game.homeTeam.name;
    cell.awayTeamNameLabel.text = game.awayTeam.name;
    cell.scheduledTimeLabel.text = [self convertDateToString:game.gameDate];
    return cell;
}

- (NSString *)convertDateToString:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm a"];
    NSString *str = [dateFormat stringFromDate:date];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    return str;
}

@end
