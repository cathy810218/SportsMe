//
//  TeamsViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "TeamsViewController.h"
#import "SportsAPI.h"
#import "TeamCell.h"
#import "Team.h"

@interface TeamsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *teams;
@end

@implementation TeamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.teams = [[NSMutableArray alloc] init];
    UINib *nib = [UINib nibWithNibName:@"TeamCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TeamCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 120;
    [SportsAPI fetchAllTeamsWithSportsType:self.sportsType completion:^(NSArray *teams) {
        self.teams = teams;
    }];
}

- (IBAction)selectAllAction:(UIBarButtonItem *)sender {
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.teams.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamCell" forIndexPath:indexPath];
    Team *team = self.teams[indexPath.row];
    cell.teamNameLabel.text = team.name;
    cell.teamImageView.image = team.logo;
    
    return cell;
}

@end
