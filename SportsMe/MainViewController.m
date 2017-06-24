//
//  MainViewController.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "MainViewController.h"
#import "SportsAPI.h"
#import "BaseballAPI.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    BaseballAPI *baseball = [[BaseballAPI alloc]init];
    [baseball beginParsing];

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma UITableViewControllerDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameMatchCell" forIndexPath:indexPath];
    
    return cell;
}

@end
