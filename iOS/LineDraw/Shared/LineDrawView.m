#import "LineDrawView.h"
#import "Shape.h"

@interface LineDrawView()

@property(strong, nonatomic) NSMutableArray* shapes;
@property(strong, nonatomic) Shape* currentShape;

@end

@implementation LineDrawView

@synthesize shapes;
@synthesize currentShape;

- (void)awakeFromNib
{
	self.shapes = [NSMutableArray array];
}


// To call me, call setNeedsDisplay!
- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	
	for(Shape* shape in self.shapes) {
		[shape draw];
	}
}

- (void)addToCurrentShapePoint:(CGPoint)p
{
	if(self.currentShape == nil) {
		self.currentShape = [[Shape alloc] init];
		[self.shapes addObject:self.currentShape];
	}
	
	[self.currentShape addPoint:p];
	
	if(self.currentShape.closed) {
		self.currentShape = nil;
	}
	
	[self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch* touch = [touches anyObject];
	CGPoint p = [touch locationInView:self];
	[self addToCurrentShapePoint:p];
}

- (IBAction)clear
{
	[self.shapes removeAllObjects];
	[self setNeedsDisplay];
}

- (IBAction)clearLastShape
{
	if(self.shapes.count > 0) {
		[self.shapes removeLastObject];
		self.currentShape = nil;
		[self setNeedsDisplay];
	}
}

- (IBAction)clearLastPoint
{
	if(self.currentShape == nil) {
		if(self.shapes.count > 0) {
			self.currentShape = [self.shapes lastObject];
		}
	}
	
	if(self.currentShape != nil) {
		if([self.currentShape removePoint]) {
			[self.shapes removeLastObject];
			self.currentShape = nil;
		}
	}

	[self setNeedsDisplay];
}

@end
