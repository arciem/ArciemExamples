//
//  RotatingContentView.h
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotatingContentView : UIView

// Behavior provided by subclasses
- (void)beginObservingModel;
- (void)endObservingModel;

@property (strong, nonatomic) id model;

@end
