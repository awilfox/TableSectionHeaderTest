//
//  MyTableViewController.m
//  TableSectionHeaderTest
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import "MyTableViewController.h"


@implementation MyTableViewController

@synthesize cellContents;

-(id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self)
	{
		[self setCellContents:[NSArray arrayWithObjects:@"One",@"Two",@"Three",@"Four",nil]];
	}
	return self;
}


-(void)dealloc
{
	[cellContents release];
	
	[super dealloc];
}



#pragma mark - View lifecycle
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(void)viewDidLoad
{
	[super viewDidLoad];
	
	exampleView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [[self tableView] frame].size.width, 36.0)];
	[exampleView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.2 alpha:1.0]];
	[exampleView setText:@"Hello"];
	[exampleView setTextColor:[UIColor whiteColor]];
	[exampleView setUserInteractionEnabled:YES];
	
	UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(helloTapped:)];
	[exampleView addGestureRecognizer:gesture];
	[gesture release];
	
	[[self tableView] setSectionFooterHeight:36.0];
}


-(void)viewDidUnload
{
	[exampleView release];
	exampleView = nil;
	
	[super viewDidUnload];
}



#pragma mark - Actions
-(void)helloTapped:(id)sender
{
	[[self tableView] reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
}



#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 5;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [cellContents count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"TableCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	cell.textLabel.text = [cellContents objectAtIndex:[indexPath row]];
	
	return cell;
}



#pragma mark - Table view delegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if(section == 1) return exampleView;
	else return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if(section == 1) return [exampleView frame].size.height;
	else return 0.0f;
}

@end
