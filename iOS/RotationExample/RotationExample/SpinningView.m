//
//  SpinningView.m
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpinningView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SpinningView

@synthesize model = model_;

- (void)dealloc
{
	self.model = nil;
}

- (SecondModel*)model
{
	return model_;
}

- (void)setModel:(SecondModel *)model
{
	[model_ removeObserver:self forKeyPath:@"color"];
	[model_ removeObserver:self forKeyPath:@"degreesPerSecond"];
	model_ = model;
	[model_ addObserver:self forKeyPath:@"color" options:NSKeyValueObservingOptionInitial context:nil];
	[model_ addObserver:self forKeyPath:@"degreesPerSecond" options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)syncToModel
{
	if(self.model != nil) {
		self.backgroundColor = self.model.color;
		[self startAnimation];
	}
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(syncToModel) object:nil];
	[self performSelector:@selector(syncToModel) withObject:nil afterDelay:0.05];
}

- (void)startAnimation
{
	CALayer *currentLayer = [self.layer presentationLayer];     
	float currentAngle = [[currentLayer valueForKeyPath:@"transform.rotation.z"] floatValue];

	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	float ang, rate;
	if(self.model.degreesPerSecond < 0) {
		rate = -self.model.degreesPerSecond;
		ang = -2 * M_PI;
	} else {
		rate = self.model.degreesPerSecond;
		ang = 2 * M_PI;
	}
	animation.fromValue = [NSNumber numberWithFloat:currentAngle];
	animation.toValue = [NSNumber numberWithFloat: currentAngle + ang];
	animation.duration = 360.0 / rate;
	animation.additive = YES;
	animation.repeatCount = HUGE_VALF;
	[self.layer removeAnimationForKey:@"rotation"];
	[self.layer addAnimation:animation forKey:@"rotation"];
}

@end
