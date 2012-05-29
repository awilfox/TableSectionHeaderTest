//
//  TSHTAppDelegate.h
//  TableSectionHeaderTest
//
//  Created by Andrew Wilcox on 29/05/2012.
//  Copyright (c) 2012 Wilcox Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface TSHTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyTableViewController *tableViewController;

@end
