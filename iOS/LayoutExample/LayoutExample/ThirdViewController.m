//
//  ThirdViewController.m
//  LayoutExample
//
//  Created by Robert McNally on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

@synthesize topLeftView = topLeftView_;
@synthesize topRightView = topRightView_;
@synthesize bottomLeftView = bottomLeftView_;
@synthesize bottomRightView = bottomRightView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Third", @"Third");
		self.tabBarItem.image = [UIImage imageNamed:@"IconToolbarDummy03"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.topLeftView.backgroundColor = [UIColor redColor];
	self.topRightView.backgroundColor = [UIColor blueColor];
	self.bottomLeftView.backgroundColor = [UIColor greenColor];
	self.bottomRightView.backgroundColor = [UIColor yellowColor];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
