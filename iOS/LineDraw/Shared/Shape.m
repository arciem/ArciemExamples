#import "Shape.h"
#import "ColorUtils.h"

@interface Shape ()

@property(nonatomic, retain) NSMutableArray* points;
@property(nonatomic, retain) UIColor* fillColor;

@end

@implementation Shape

@synthesize points;
@synthesize closed;
@synthesize fillColor;

- (id)init
{
	if(self = [super init]) {
		self.points = [NSMutableArray array];
	}
	
	return self;
}

- (void)dealloc
{
	self.points = nil;
	self.fillColor = nil;

	[super dealloc];
}

- (void)draw
{
	// make the path object
	
	UIBezierPath* path = [UIBezierPath bezierPath];
	
	BOOL first = YES;
	for(NSValue* val in self.points) {
		CGPoint p = [val CGPointValue];
		if(first) {
			[path moveToPoint:p];
			first = NO;
		} else {
			[path addLineToPoint:p];
		}
	}
	
	if(self.closed) {
		[path closePath];
	}
	
	//
	// draw the path object
	//
	
	// fill
	if(self.closed) {
		[self.fillColor set];
		[path fill];
	}
	
	// stroke
	[[UIColor blueColor] set];
	[path setLineWidth:4.0];
	[path stroke];
	
	// dots
	if(!self.closed) {
		CGContextRef context = UIGraphicsGetCurrentContext();
		CGContextSaveGState(context);
		first = YES;
		for(NSValue* val in self.points) {
			UIColor* color;
			if(first) {
				color = [UIColor redColor];
				first = NO;
			} else {
				color = [UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:1.0];
			}
			CGContextSetFillColorWithColor(context, color.CGColor);
			CGPoint p = [val CGPointValue];
			CGRect r = CGRectMake(p.x, p.y, 0, 0);
			r = CGRectInset(r, -5.0, -5.0);
			CGContextFillEllipseInRect(context, r);
		}
		CGContextRestoreGState(context);
	}
}

- (void)addPoint:(CGPoint)p
{
	if(self.points.count > 2) {
		NSValue* val = [self.points objectAtIndex:0];
		CGPoint firstPoint = [val CGPointValue];
		if(fabsf(p.x - firstPoint.x) < 25.0 && fabsf(p.y - firstPoint.y) < 25.0) {
			self.closed = YES;
			self.fillColor = [randomColor() colorWithAlphaComponent:0.25];
		}
	}
	
	if(!self.closed) {
		NSValue* val = [NSValue valueWithCGPoint:p];
		[self.points addObject:val];
	}
}

- (BOOL)removePoint
{
	if(self.closed) {
		self.closed = NO;
	} else {
		if(self.points.count > 0) {
			[self.points removeLastObject];
		}
	}
	
	return self.points.count == 0;
}

@end
