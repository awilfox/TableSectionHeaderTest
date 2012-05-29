//
//  MyTableViewController.h
//  TableSectionHeaderTest
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController {
	NSArray *cellContents;
	
	UILabel *exampleView;
}

@property (retain) NSArray *cellContents;

@end
