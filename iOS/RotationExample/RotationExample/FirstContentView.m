//
//  FirstContentView.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstContentView.h"

@interface FirstContentView ()

@property (readonly, nonatomic) FirstModel* myModel;

@end

@implementation FirstContentView

@synthesize textView = textView_;
@synthesize spinningView = spinningView_;

- (FirstModel*)myModel
{
	return (FirstModel*)self.model;
}

- (void)beginObservingModel
{	
	[super beginObservingModel];

	self.textView.text = self.myModel.text;
	self.spinningView.model = self.myModel.secondModel;
}

- (void)endObservingModel
{
	[super endObservingModel];

	self.spinningView.model = nil;
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return NO;
    } else {
		NSString* str = [textView.text stringByReplacingCharactersInRange:range withString:text];
		self.myModel.text = str;
        return YES;
    }
}

@end
