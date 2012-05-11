//
//  SecondContentView.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondContentView.h"

@interface SecondContentView ()

@property (readonly, nonatomic) SecondModel* myModel;

@end

@implementation SecondContentView

@synthesize spinningView = spinningView_;

- (SecondModel*)myModel
{
	return (SecondModel*)self.model;
}

- (void)beginObservingModel
{	
	[super beginObservingModel];

	self.spinningView.model = self.myModel;
}

- (void)endObservingModel
{
	[super endObservingModel];

	self.spinningView.model = nil;
}

@end
