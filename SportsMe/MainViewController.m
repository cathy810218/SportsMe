//
//  MainViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "MainViewController.h"
#import "GameMatchCell.h"
#import "SportsAPI.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray *todayGames;
@property (strong, nonatomic) NSArray *tomorrowGames;
@property (strong, nonatomic) NSArray *favoriteGames;
@property (strong, nonatomic) NSArray *displayGames;

@end

@implementation MainViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"GameMatchCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"GameMatchCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    [self fetchTodaysGames];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg.png"] forBarMetrics:UIBarMetricsDefault];

}

- (void)fetchTodaysGames {
    
}

- (IBAction)segmentControlAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"0");
            self.displayGames = self.todayGames;
            break;
        case 1:
            NSLog(@"1");
            self.displayGames = self.tomorrowGames;
            break;
        case 2:
            NSLog(@"2");
            self.displayGames = self.favoriteGames;
            break;
        default:
            break;
    }
}

#pragma UITableViewControllerDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GameMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameMatchCell" forIndexPath:indexPath];
    
    return cell;
}

@end
