//
//  NativeWidgetViewController.m
//  NativeWidget
//
//  Created by Robert McNally on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NativeWidgetViewController.h"
#import "UIViewUtils.h"
#import "UIColorUtils.h"
#import "FaveButton.h"

@implementation NativeWidgetViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSArray* colors = [NSArray arrayWithObjects:
					   [UIColor colorWithRGBValue:0x63152e],
					   [UIColor colorWithRGBValue:0xc93c2c],
					   [UIColor colorWithRGBValue:0xd18600],
					   [UIColor colorWithRGBValue:0xc2ed31],
					   [UIColor colorWithRGBValue:0x3d5953],
					   nil];
	
	NSArray* titles = [NSArray arrayWithObjects:
					   @"One",
					   @"Two",
					   @"Three",
					   @"Four",
					   @"Five",
					   nil];
	
	UINavigationBar* lastNavBar = nil;
	for(NSUInteger i = 0; i < colors.count; i++) {
		UIColor* color = [colors objectAtIndex:i];
		NSString* title = [titles objectAtIndex:i];

		UINavigationBar* navBar = [[[UINavigationBar alloc] initWithFrame:CGRectZero] autorelease];
		navBar.tintColor = color;
		UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:title];
		navBar.items = [NSArray arrayWithObject:item];
		UIButton* button = [[[FaveButton alloc] init] autorelease];
		button.tintColor = color;
		item.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
//		item.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonTapped)] autorelease];
		item.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
		[self.view addSubview:navBar];
		[navBar sizeToFit];
		if(lastNavBar != nil) {
			navBar.top = lastNavBar.bottom;
		}
		lastNavBar = navBar;
	}
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
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
