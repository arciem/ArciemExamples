//
//  ColorTouchViewController.m
//  ColorTouch
//
//  Created by Robert McNally on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorTouchViewController.h"

@implementation ColorTouchViewController

@synthesize colorTouchView = colorTouchView_;
@synthesize switchControl = switchControl_;
@synthesize label = label_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.label.text = @"";

	self.colorTouchView.delegate = self;
	self.colorTouchView.visibleImage = [UIImage imageNamed:@"VisibleImage"];
	self.colorTouchView.colorMapImage = [UIImage imageNamed:@"ColorMap"];
	self.colorTouchView.colorMappings = [NSDictionary dictionaryWithObjectsAndKeys:
		@"Red", [NSNumber numberWithUnsignedInt:0xFF0000FF], 
		@"Green", [NSNumber numberWithUnsignedInt:0x00FF00FF], 
		@"Blue", [NSNumber numberWithUnsignedInt:0x0000FFFF], 
		@"Cyan", [NSNumber numberWithUnsignedInt:0x00FFFFFF], 
		@"Magenta", [NSNumber numberWithUnsignedInt:0xFF00FFFF], 
		@"Yellow", [NSNumber numberWithUnsignedInt:0xFFFF00FF], 
		@"White", [NSNumber numberWithUnsignedInt:0xFFFFFFFF], 
		@"Black", [NSNumber numberWithUnsignedInt:0x000000FF], 
		nil];
}

- (void)viewDidUnload
{
	self.colorTouchView = nil;
	self.switchControl = nil;
	self.label = nil;

	[super viewDidUnload];
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

- (IBAction)switchChanged
{
	self.colorTouchView.visibleImage = self.switchControl.on ? [UIImage imageNamed:@"ColorMap"] : [UIImage imageNamed:@"VisibleImage"];
}

- (CGFloat)luminanceForColor:(UIColor*)color
{
	CGFloat luminance = 0.0;

	CGColorRef cgColor = color.CGColor;
	CGColorSpaceRef colorSpace = CGColorGetColorSpace(cgColor);
	CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(colorSpace);
	const CGFloat* components = CGColorGetComponents(cgColor);
	
	if(colorSpaceModel == kCGColorSpaceModelMonochrome) {
		luminance = components[0];
	} else if(colorSpaceModel == kCGColorSpaceModelRGB) {
		luminance = 0.3 * components[0] + 0.59 * components[1] + 0.11 * components[2];
	}

	return luminance;
}

#pragma mark -
#pragma mark ColorTouchViewDelegate

- (void)colorTouchView:(ColorTouchView*)view didTapRegion:(NSString*)regionID containingColor:(UIColor*)color
{
	self.label.text = regionID;
	self.label.backgroundColor = color;
	CGFloat luminance = [self luminanceForColor:color];
	NSLog(@"luminance:%f", luminance);
	self.label.textColor = luminance < 0.4 ? [UIColor whiteColor] : [UIColor blackColor];
	[self.label sizeToFit];
	CGRect frame = self.label.frame;
	frame.origin.x = CGRectGetMaxX(self.view.bounds) - frame.size.width - 20;
	self.label.frame = frame;
}

@end
