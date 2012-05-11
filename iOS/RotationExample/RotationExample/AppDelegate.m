//
//  AppDelegate.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "FirstModel.h"

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) FirstModel* mainModel;

@end

@implementation AppDelegate

@synthesize window = window_;
@synthesize navigationController = navigationController_;
@synthesize mainModel = mainModel_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self setupModel];
	[self setupWindow];
    return YES;
}

- (void)setupModel
{
	self.mainModel = [[FirstModel alloc] init];
	self.mainModel.text = @"The quick brown fox jumps over the lazy dog.";
	self.mainModel.secondModel = [[SecondModel alloc] init];
	self.mainModel.secondModel.color =[UIColor purpleColor];
	self.mainModel.secondModel.degreesPerSecond = 10.0;
}

- (void)setupWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
	
	FirstViewController* viewController = [[[NSBundle mainBundle] loadNibNamed:@"FirstViewController" owner:nil options:nil] objectAtIndex:0];
	viewController.model = self.mainModel;

	self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[self.window setRootViewController:self.navigationController];
	
    [self.window makeKeyAndVisible];
}

@end
