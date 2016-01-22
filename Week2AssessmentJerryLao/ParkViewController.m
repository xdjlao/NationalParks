//
//  ParkViewController.m
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "ParkViewController.h"
#import "DetailViewController.h"
#import "Park.h"
#import "TableViewCell.h"

@interface ParkViewController () <UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *parksArray;

@end

@implementation ParkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Park *parkOne = [[Park alloc] initWithName:@"Grand Canyon National Park"
                                  withLocation: @"Coconino County, Arizona"
                                      withSite:@"https://en.wikipedia.org/wiki/Grand_Canyon"
                                withImageNamed:@"grandcanyon"];
    
    Park *parkTwo = [[Park alloc] initWithName:@"Yosemite National Park"
                                  withLocation: @"Tuolumne County, California"
                                      withSite:@"https://en.wikipedia.org/wiki/Yosemite_National_Park"
                                withImageNamed:@"yosemite"];
    
    Park *parkThree = [[Park alloc] initWithName:@"Acadia National Park"
                                    withLocation: @"Hancock County, Maine"
                                        withSite:@"https://en.wikipedia.org/wiki/Acadia_National_Park"
                                  withImageNamed:@"acadia"];
    
    Park *parkFour = [[Park alloc] initWithName:@"Glacier National Park"
                                   withLocation: @"Flathead County, Montana"
                                       withSite:@"https://en.wikipedia.org/wiki/Glacier_National_Park_(U.S.)"
                                 withImageNamed:@"glacier"];
    
    Park *parkFive = [[Park alloc] initWithName:@"Denali National Park"
                                   withLocation: @"Denali Borough, Alaska"
                                       withSite:@"https://en.wikipedia.org/wiki/Denali_National_Park_and_Preserve"
                                 withImageNamed:@"denali"];
    
    self.parksArray = [[NSMutableArray alloc] initWithObjects:parkOne, parkTwo, parkThree, parkFour, parkFive, nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(TableViewCell *)sender {
    DetailViewController *destination = segue.destinationViewController;
    destination.title = sender.parkNameLabel.text;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Park *selectedPark = [self.parksArray objectAtIndex:indexPath.row];
    destination.currentPark = selectedPark;
    
    destination.delegate = self;
}

#pragma mark - UITableView Delegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Park *currentPark = [self.parksArray objectAtIndex:indexPath.row];
    
    UIImage *image = [UIImage imageNamed: currentPark.imageName];
    [cell.leftImage setImage:image];
    
    cell.parkNameLabel.text = currentPark.name;
    cell.parkLocationLabel.text = currentPark.location;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.parksArray.count;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.parksArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Custom Delegate

- (void)newParkName:(NSString *)parkName {
    self.title = parkName;
}

@end
