//
//  SecondContentView.h
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RotatingContentView.h"
#import "SecondModel.h"
#import "SpinningView.h"

@interface SecondContentView : RotatingContentView

@property (weak, nonatomic) IBOutlet SpinningView* spinningView;

@end
