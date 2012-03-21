//
//  FirstViewController.m
//  LayoutExample
//
//  Created by Robert McNally on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) UIView* bottomView;
@property (strong, nonatomic) UIView* topLeftView;
@property (strong, nonatomic) UIView* topRightView;

@end

@implementation FirstViewController

@synthesize bottomView = bottomView_;
@synthesize topLeftView = topLeftView_;
@synthesize topRightView = topRightView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"First", @"First");
		self.tabBarItem.image = [UIImage imageNamed:@"IconToolbarDummy01"];
    }
    return self;
}

- (void)loadView
{
	CGRect frame = CGRectMake(0, 0, 100, 100);
	self.view = [[UIView alloc] initWithFrame:frame];
	self.view.backgroundColor = [UIColor orangeColor];

	CGRect topFrame;
	CGRect bottomFrame;
	CGRectDivide(frame, &bottomFrame, &topFrame, 50, CGRectMaxYEdge);
	self.bottomView = [[UIView alloc] initWithFrame:bottomFrame];
	self.bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
	[self.view addSubview:self.bottomView];
	self.bottomView.backgroundColor = [UIColor redColor];
	
	CGRect topLeftFrame;
	CGRect topRightFrame;
	CGRectDivide(topFrame, &topLeftFrame, &topRightFrame, 50, CGRectMinXEdge);
	self.topLeftView = [[UIView alloc] initWithFrame:topLeftFrame];
	self.topLeftView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
	[self.view addSubview:self.topLeftView];
	self.topLeftView.backgroundColor = [UIColor blueColor];

	self.topRightView = [[UIView alloc] initWithFrame:topRightFrame];
	self.topRightView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
	[self.view addSubview:self.topRightView];
	self.topRightView.backgroundColor = [UIColor greenColor];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	self.topLeftView.backgroundColor = [UIColor redColor];
	self.topRightView.backgroundColor = [UIColor blueColor];
	self.bottomView.backgroundColor = [UIColor greenColor];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.topLeftView = nil;
	self.topRightView = nil;
	self.bottomView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
