//
//  CustomLayoutView.m
//  LayoutExample
//
//  Created by Robert McNally on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomLayoutView.h"

@interface CustomLayoutView ()

@property (strong, readwrite, nonatomic) UIView* leftView;
@property (strong, readwrite, nonatomic) UIView* topRightView;
@property (strong, readwrite, nonatomic) UIView* bottomRightView;

@end

@implementation CustomLayoutView

@synthesize leftView = leftView_;
@synthesize topRightView = topRightView_;
@synthesize bottomRightView = bottomRightView_;
@synthesize leftViewColor = leftViewColor_;
@synthesize topRightViewColor = topRightViewColor_;
@synthesize bottomRightViewColor = bottomRightViewColor_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.autoresizesSubviews = NO;

		self.leftView = [[UIView alloc] initWithFrame:CGRectZero];
		[self addSubview:self.leftView];
		
		self.topRightView = [[UIView alloc] initWithFrame:CGRectZero];
		[self addSubview:self.topRightView];
		
		self.bottomRightView = [[UIView alloc] initWithFrame:CGRectZero];
		[self addSubview:self.bottomRightView];
	}
    return self;
}

- (void)layoutSubviews
{
	CGRect frame = self.bounds;
	
	CGRect leftFrame;
	CGRect rightFrame;
	CGRectDivide(frame, &leftFrame, &rightFrame, frame.size.width / 2, CGRectMinXEdge);
	
	self.leftView.frame = leftFrame;
	
	CGRect topRightFrame;
	CGRect bottomRightFrame;
	CGRectDivide(rightFrame, &topRightFrame, &bottomRightFrame, frame.size.height / 2, CGRectMinYEdge);
	
	self.topRightView.frame = topRightFrame;
	self.bottomRightView.frame = bottomRightFrame;
}

- (UIColor*)leftViewColor
{
	return self.leftView.backgroundColor;
}

- (void)setLeftViewColor:(UIColor *)color
{
	self.leftView.backgroundColor = color;
}

- (UIColor*)topRightViewColor
{
	return self.topRightView.backgroundColor;
}

- (void)setTopRightViewColor:(UIColor *)color
{
	self.topRightView.backgroundColor = color;
}

- (UIColor*)bottomRightViewColor
{
	return self.bottomRightView.backgroundColor;
}

- (void)setBottomRightViewColor:(UIColor *)color
{
	self.bottomRightView.backgroundColor = color;
}
@end
