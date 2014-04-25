//
//  MasterViewController.h
//  HTBannerView
//
//  Created by Takemoto on 4/24/14.
//  Copyright (c) 2014 Takemoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *states;

@end
