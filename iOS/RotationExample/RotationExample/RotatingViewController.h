//
//  RotatingViewController.h
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatingContentView.h"

@interface RotatingViewController : UIViewController

@property (strong, nonatomic) IBOutlet RotatingContentView* portraitContentView;
@property (strong, nonatomic) IBOutlet RotatingContentView* landscapeContentView;

@property (strong, nonatomic) id model;

@end
