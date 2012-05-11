//
//  RotatingViewController.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RotatingViewController.h"

@interface RotatingViewController ()

@property (weak, nonatomic) RotatingContentView* enteringContentView;
@property (weak, nonatomic) RotatingContentView* exitingContentView;

@end

@implementation RotatingViewController

@synthesize portraitContentView = portraitContentView_;
@synthesize landscapeContentView = landscapeContentView_;
@synthesize enteringContentView = enteringContentView_;
@synthesize exitingContentView = exitingContentView_;
@synthesize model = model_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

	[self syncToInterfaceOrientation:self.interfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	BOOL result = YES;
	
	if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
		result = (interfaceOrientation != UIDeviceOrientationPortraitUpsideDown);
	}
	
	return result;
}

- (void)conformContentViewsToBounds
{
	self.enteringContentView.frame = self.view.bounds;
	self.exitingContentView.frame = self.view.bounds;
}

- (void)setupForRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
		self.enteringContentView = self.portraitContentView;
		self.exitingContentView = self.landscapeContentView;
	} else {
		self.enteringContentView = self.landscapeContentView;
		self.exitingContentView = self.portraitContentView;
	}
	
	// Only fade the new interface in if we're actually changing from portrait to landscape, or vice versa. It is possible that we are just flipping 180°, so in that case we don't want to change the current content view's alpha at all.
	if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation) != UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
		self.enteringContentView.alpha = 0.0;
	}
	
	[self conformContentViewsToBounds];
	[self.view addSubview:self.enteringContentView];
	self.enteringContentView.model = self.model;
	[self.enteringContentView beginObservingModel];
}

- (void)animateRotationWithDuration:(NSTimeInterval)duration
{
	[UIView animateWithDuration:duration animations:^{
		self.enteringContentView.alpha = 1.0;
		[self conformContentViewsToBounds];
	}];
}

- (void)completeRotation
{
	[self.exitingContentView endObservingModel];
	[self.exitingContentView removeFromSuperview];
}

- (void)syncToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	[self setupForRotationToInterfaceOrientation:interfaceOrientation];
	[self animateRotationWithDuration:0];
	[self completeRotation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	
	[self setupForRotationToInterfaceOrientation:toInterfaceOrientation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
	[super willAnimateRotationToInterfaceOrientation:interfaceOrientation duration:duration];
	
	[self animateRotationWithDuration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	
	[self completeRotation];
}

@end
