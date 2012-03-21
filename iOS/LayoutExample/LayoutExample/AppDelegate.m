//
//  AppDelegate.m
//  LayoutExample
//
//  Created by Robert McNally on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation AppDelegate

@synthesize window = window_;
@synthesize tabBarController = tabBarController_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:nil bundle:nil];
	UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
	UIViewController *viewController3 = [[ThirdViewController alloc] initWithNibName:nil bundle:nil];
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, viewController3, nil];
	self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
