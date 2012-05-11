//
//  SecondViewController.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondContentView.h"

@interface SecondViewController ()

@property (readonly, nonatomic) SecondModel* myModel;

@end

@implementation SecondViewController

- (SecondModel*)myModel
{
	return (SecondModel*)self.model;
}

- (IBAction)changeButtonTapped
{
	float hue = rand() / (((float)RAND_MAX) + 1.0);
	UIColor* color = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
	float slowest = 40;
	float coeff = 180;
	float rate = ((rand() / (((float)RAND_MAX) + 1.0)) * coeff + slowest) - (coeff + slowest) / 2.0;;

	self.myModel.color = color;
	self.myModel.degreesPerSecond = rate;
}

@end
