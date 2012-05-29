//
//  TSHTAppDelegate.m
//  TableSectionHeaderTest
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import "TSHTAppDelegate.h"

@implementation TSHTAppDelegate

@synthesize window = _window;
@synthesize tableViewController = _tableViewController;


-(void)dealloc
{
	[_window release];
	[_tableViewController release];
	[super dealloc];
}


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self setWindow:[[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]];
	[self setTableViewController:[[[MyTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease]];
	
	[[self window] setBackgroundColor:[UIColor whiteColor]];
	[[self window] addSubview:[[self tableViewController] view]];
	[[self window] makeKeyAndVisible];
	
	return YES;
}


@end
