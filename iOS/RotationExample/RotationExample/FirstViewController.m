//
//  FirstViewController.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstContentView.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (readonly, nonatomic) FirstModel* myModel;

@end

@implementation FirstViewController

- (FirstModel*)myModel
{
	return (FirstModel*)self.model;
}

- (IBAction)nextButtonTapped
{
	SecondViewController* viewController = [[[NSBundle mainBundle] loadNibNamed:@"SecondViewController" owner:nil options:nil] objectAtIndex:0];
	viewController.model = self.myModel.secondModel;
	[self.navigationController pushViewController:viewController animated:YES];
}

@end
