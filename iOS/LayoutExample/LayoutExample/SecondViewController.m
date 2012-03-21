//
//  SecondViewController.m
//  LayoutExample
//
//  Created by Robert McNally on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomLayoutView.h"

@interface SecondViewController ()

@property (strong, nonatomic) CustomLayoutView* customLayoutView;

@end

@implementation SecondViewController

@synthesize customLayoutView = customLayoutView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Second", @"Second");
		self.tabBarItem.image = [UIImage imageNamed:@"IconToolbarDummy02"];
    }
    return self;
}

- (void)loadView
{
	self.customLayoutView = [[CustomLayoutView alloc] initWithFrame:CGRectZero];
	self.view = self.customLayoutView;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.customLayoutView.leftViewColor = [UIColor redColor];
	self.customLayoutView.topRightViewColor = [UIColor greenColor];
	self.customLayoutView.bottomRightViewColor = [UIColor blueColor];
}

- (void)viewDidUnload
{
	self.customLayoutView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
