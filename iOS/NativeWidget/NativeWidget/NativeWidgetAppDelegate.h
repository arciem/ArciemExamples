//
//  NativeWidgetAppDelegate.h
//  NativeWidget
//
//  Created by Robert McNally on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NativeWidgetViewController;

@interface NativeWidgetAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NativeWidgetViewController *viewController;

@end
