//
//  main.m
//  ColorTouch
//
//  Created by Robert McNally on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ColorTouchAppDelegate.h"

int main(int argc, char *argv[])
{
	int result;
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	result = UIApplicationMain(argc, argv, nil, NSStringFromClass([ColorTouchAppDelegate class]));
	[pool release];
	return result;
}
