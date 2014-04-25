//
//  MasterViewController.m
//  HTBannerView
//
//  Created by Takemoto on 4/24/14.
//  Copyright (c) 2014 Takemoto. All rights reserved.
//

#import "MasterViewController.h"
#import "HTABannerView.h"

@interface MasterViewController ()

@property (nonatomic, strong) HTABannerView *bannerView;

@end


@implementation MasterViewController

#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the title
	self.title = @"U.S. States";
    
    // Set the states array
    self.states = [[NSArray alloc] initWithObjects:
              @"Alaska", @"Arizona", @"Arkansas", @"California",
              @"Colorado", @"Connecticut", @"Delaware", @"Florida",
              @"Georgia", @"Hawaii", @"Idaho", @"Illinois",
              @"Indiana", @"Iowa", @"Kansas", @"Kentucky",
              @"Louisiana", @"Maine", @"Maryland", @"Massachusetts",
              @"Michigan",@"Minnesota", @"Mississippi", @"Missouri",
              @"Montana", @"Nebraska",@"Nevada", @"New Hampshire",
              @"New Jersey", @"New Mexico", @"New York",
              @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma",
              @"Oregon",@"Pennsylvania", @"Rhode Island",
              @"South Carolina", @"South Dakota", @"Tennessee",
              @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington",
              @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    
    
    // Set edge insets for iOS7 to prevent navigation bar covers cells
    CGFloat topLayoutGuide = self.topLayoutGuide.length;
    self.tableView.contentInset = UIEdgeInsetsMake(topLayoutGuide, 0, 0, 0);
    
    // setup iAd
    self.bannerView = [[HTABannerView alloc] initWithContentViewController:self
                                                              ContentView:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.bannerView layoutAnimated:NO];
}


#pragma mark - Table view data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.states count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.states objectAtIndex:indexPath.row];
    
    return cell;
}


@end
