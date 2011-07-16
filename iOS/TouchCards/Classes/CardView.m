#import "CardView.h"

@interface CardView ()

@property(nonatomic) CGPoint offset;
@property(nonatomic, retain) UIImageView* frontView;
@property(nonatomic, retain) UIImageView* backView;
@property(nonatomic, getter = isFaceDown) BOOL faceDown; // setter is called setFaceDown, getter is defined to be isFaceDown

@end

@implementation CardView

@synthesize delegate;
@synthesize offset;
@synthesize frontView;
@synthesize backView;
@synthesize faceDown = faceDown_; // create backing variable with different name from property name

- (id)initWithFrame:(CGRect)frame frontImage:(UIImage*)frontImage backImage:(UIImage*)backImage
{
	if(self = [super initWithFrame:frame]) {
		self.frontView = [[[UIImageView alloc] initWithImage:frontImage] autorelease];
		self.frontView.frame = self.bounds;
		self.frontView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		self.backView = [[[UIImageView alloc] initWithImage:backImage] autorelease];
		self.backView.frame = self.bounds;
		self.backView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		
		[self addSubview:self.frontView];
	}

	return self;
}

- (void)dealloc
{
	self.frontView = nil;
	self.backView = nil;
	[super dealloc];
}

- (void)moveToPoint:(CGPoint)p
{
	CGRect f = self.frame;
	f.origin = CGPointMake(p.x - self.offset.x, p.y - self.offset.y);
	self.frame = f;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"%@ touchesBegan", self);
	UITouch* touch = [touches anyObject];
	self.offset = [touch locationInView:self];
	[self.superview bringSubviewToFront:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	CGPoint p = [touch locationInView:self.superview];
	[self moveToPoint:p];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.faceDown = !self.faceDown;
	
	[self.delegate cardViewWasTouched:self];
}

// This is the getter for the "faceDown" property
- (BOOL)isFaceDown
{
	return faceDown_;
}

// This is the setter for the "faceDown" property
- (void)setFaceDown:(BOOL)newFaceDown
{
	if(faceDown_ != newFaceDown) {
		faceDown_ = newFaceDown;

		UIView* viewToRemove;
		UIView* viewToAdd;
		UIViewAnimationTransition transition;
		if(faceDown_) {
			viewToRemove = self.frontView;
			viewToAdd = self.backView;
			transition = UIViewAnimationTransitionFlipFromLeft;
		} else {
			viewToRemove = self.backView;
			viewToAdd = self.frontView;
			transition = UIViewAnimationTransitionFlipFromRight;
		}
		
		[UIView beginAnimations:@"flip" context:nil];
			[UIView setAnimationTransition:transition forView:self cache:YES];
			[UIView setAnimationDuration:1.0];
			[viewToRemove removeFromSuperview];
			[self addSubview:viewToAdd];
		[UIView commitAnimations];
	}
}

@end
