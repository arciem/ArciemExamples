//
//  FirstContentView.h
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RotatingContentView.h"
#import "FirstModel.h"
#import "SpinningView.h"

@interface FirstContentView : RotatingContentView<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView* textView;
@property (weak, nonatomic) IBOutlet SpinningView* spinningView;

@end
