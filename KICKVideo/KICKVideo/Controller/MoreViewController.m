//
//  MoreViewController.m
//  KICKVideo
//
//  Created by 杜 鹏 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreCell.h"
#import "OtherVideosViewController.h"
#import "MailViewController.h"
#import "CreditViewController.h"

@implementation MoreViewController

@synthesize moreArray = _moreArray;

-(void)dealloc{
    [_moreArray release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"More";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.moreArray = [[NSArray alloc] initWithObjects:@"Other videos",@"info",@"credit", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.moreArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MoreCell";
    
    MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    //修改分割线
    [tableView setSeparatorColor:[UIColor blackColor]];
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    tableView.tableHeaderView = headerView;
    tableView.tableFooterView = headerView;
    [headerView release];
    
    // Configure the cell...
    cell.textLabel.text = [self.moreArray objectAtIndex:[indexPath row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreCell * currentCell = (MoreCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath]; 
    if (currentCell.textLabel.text == @"Other videos") 
    {
        OtherVideosViewController *otherVideosVC = [[OtherVideosViewController alloc] init];
        [self.navigationController pushViewController:otherVideosVC animated:YES];
        [otherVideosVC release];
    }
    if (currentCell.textLabel.text == @"info") 
    {
        MailViewController *mailVC = [[MailViewController alloc] init];
        [self.navigationController pushViewController:mailVC animated:YES];
        [mailVC release];
    }
    if (currentCell.textLabel.text == @"credit") 
    {
        CreditViewController *creditVC = [[CreditViewController alloc] init];
        [creditVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:creditVC animated:YES];
        [creditVC release];
    }
}

@end
